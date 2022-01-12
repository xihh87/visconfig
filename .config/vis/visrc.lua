require('vis')

vis.events.subscribe(
	vis.events.INIT,
	function()
		vis:command('set autoindent on')
		vis:command('set expandtab on')
		vis:command('set tabwidth 4')
	end
)

vis.events.subscribe(
   vis.events.WIN_OPEN,
   function()
      vis:command('set numbers on')
      vis:command('set colorcolumn 72')
   end
)

vis.events.subscribe(
    vis.events.FILE_OPEN,
    function(win)
       if win.syntax ~= 'yaml' then
          vis:command('set tabwidth 2')
       end
    end
)
