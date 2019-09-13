# Vim Byebug Breakpoints

This vim plugin provides the ability to toggle breakpoints in Ruby code using the Byebug debugger.

It's intended to be a lightweight solution to set breakpoints without having to litter your code with `byebug` statements - but it's not a full-flegded debugger.  It does, however, work without needing to configure any server.  The plugin simply inserts breakpoint commands into your project's auto-loaded byebug.rc.

## Installation

Install `kmewhort/vim-byebug-breakpoints` using your favourite vim plugin manager.

## Usage

Once installed, use <Leader>b to toggle breakpoints on/off in any ruby code. You can disable this mapping with `let g:vim_byebug_breakpoints_map_keys = 0`, then map the key combination of your choice to the command `:ToggleByebugBreakpoint`.

You have several options for running your code with byebug and hitting the breakpoints:
 1. Launch ruby scripts, specs, etc using byebug - eg. `byebug rpsec my_code.rb`;
 2. Add byebug hooks directly into your spec helper or other initialization code - eg.
```
require 'byebug'
Byebug.start
Byebug.run_init_script
```
3. For use with Rails, use [byebug-rails-loader](https://github.com/kmewhort/byebug-rails-loader)

Ensure that you start vim from your project directory - this is where Vim Byebug Breakpoints looks for your .byebug.rc first time. If not found it will  go up throught the ancestors until found a .byebug.rc if not It will create one at current directory.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kmewhort/vim-byebug-breakpoints


## License

The plugin is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT). 
