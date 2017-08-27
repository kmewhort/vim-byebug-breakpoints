highlight vim_byebug_breakpts ctermbg=darkred guibg=darkred

function! vim_byebug_breakpoints#LoadByebugBreakpoints()
ruby <<EOF
  base_dir = Vim::evaluate('getcwd()')
  rc_filename = "#{base_dir}/.byebugrc"
  file_in_buffer = Vim::Buffer.current.name

  if File.exist?(rc_filename) && file_in_buffer && file_in_buffer.start_with?(base_dir)
    file_in_buffer = file_in_buffer[base_dir.length+1..-1] 
    lines_with_breaks = []

    File.foreach(rc_filename) do |line|
      line.match(/\s*break\s+([^\:]+)\:(\d+)/) do |match|
        relative_filename, line_num = match[1..2]
        lines_with_breaks << line_num if relative_filename == file_in_buffer
      end
    end
   
    line_matchers = if lines_with_breaks.any?
      lines_with_breaks.uniq.map {|num| "\\%#{num}l"}.join('\|')
    else
      ""
    end

    Vim::command("match vim_byebug_breakpts /#{line_matchers}/")
  end
EOF
endfunction

function! vim_byebug_breakpoints#ToggleByebugBreakpoint()
ruby <<EOF
  base_dir = Vim::evaluate('getcwd()')
  rc_filename = "#{base_dir}/.byebugrc"
  file_in_buffer = Vim::Buffer.current.name

  if file_in_buffer && file_in_buffer.start_with?(base_dir)
    file_in_buffer = file_in_buffer[base_dir.length+1..-1] 
    break_code = "break #{file_in_buffer}:#{Vim::Buffer.current.line_number}"

    # first try to remove the breakpoint
    removed = false
    if File.exist? rc_filename
      rc_str = IO.read(rc_filename)
      orig_length = rc_str.length

      if rc_str.gsub! break_code, ''
        rc_str.gsub! /^$\n/, ''
        File.open(rc_filename, 'w') {|f| f.write rc_str }
        removed = true 
      end
    end

    # if wasn't already there, add it
    unless removed
      File.open(rc_filename, 'a') {|f| f.write "#{break_code}\n" }
    end

    # TODO: just toggle the line actually changed
    Vim::evaluate('vim_byebug_breakpoints#LoadByebugBreakpoints()')
  end
EOF
endfunction

