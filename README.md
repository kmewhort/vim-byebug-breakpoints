# Vim Byebug Breakpoints

This vim plugin provides the ability to toggle breakpoints in Ruby code using the Byebug debugger.

It's intended to be a lightweight solution to set breakpoints without having to litter your code with `byebug` statements - but it's not a full-flegded debugger.  It does, however, work without needing to configure any server.  The plugin simply inserts breakpoint commands into your project's auto-loaded byebug.rc.

## Installation

Install `kmewhort/vim-byebug-breakpoints` using your favourite vim plugin manager.

## Usage

Once installed, use <Leader>b to toggle breakpoints on/off in any ruby code. You can disable this mapping with `let g:vim_byebug_breakpoints_map_keys = 0`, then map the key combination of your choice to the command `:ToggleByebugBreakpoint`.

Your breakpoints will be hit when you launch ruby scripts, specs, etc using eg. `byebug rpsec my_code.rb`.  Alternatively, you can add byebug hooks directly into your spec helper or other initialization code: 

Ensure that you start vim from your project directory - this is where Vim Byebug Breakpoints looks for your .byebug.rc.
```
require 'byebug'
Byebug.start
Byebug.run_init_script
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kmewhort/vim-byebug-breakpoints


## License

The plugin is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT). 
