require('vis')

vis.events.subscribe(
	vis.events.INIT,
	function()
		vis:command('set autoindent on')
	end
)

vis.events.subscribe(
	vis.events.WIN_OPEN,
	function(win)
		vis:command('set numbers on')
		vis:command('set show-spaces on')
		vis:command('set show-tabs on')
		vis:command('set show-newlines on')
		vis:command('set show-eof on')

		vis:command('set colorcolumn 72')

		vis:command('set tabwidth 4')
		vis:command('set expandtab on')

	end
)

vis.events.subscribe(
	vis.events.FILE_SAVE_PRE,
	function(file, path)
		-- TODO: remove trailing whitespace
		-- vis:command('% | trail') -- fails with segmentation fault
		-- vis:command('x#[	]$# d') -- corrupted linked list
	end
)
