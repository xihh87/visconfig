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
		vis:command('set show-spaces off')
		vis:command('set show-tabs on')
		vis:command('set show-newlines on')
		vis:command('set show-eof on')

		vis:command('set colorcolumn 72')

		vis:command('set tabwidth 4')
		vis:command('set expandtab on')

		if not win.syntax then
			if win.file.name == '.git/COMMIT_EDITMSG' then
				vis:command('set syntax text')
			else
				vis:command('set syntax markdown')
			end
		end

		if win.syntax then
			vis:info('syntax: '..win.syntax)
		else
			vis:info('syntax: <nil>')
		end

		if win.syntax == 'yaml' or win.syntax == 'bash' then
			vis:command('set tabwidth 2')
		elseif
			win.syntax == 'ansi_c' or
			win.syntax == 'bash' or
			win.syntax == 'latex' or
			win.syntax == 'lua'
		then
			vis:command('set expandtab off')
		end

		if win.file.name then
			if string.match(win.file.name, 'mkfile$') then
				vis:command('set expandtab off')
			end
			if string.match(win.file.name, '.tsv$') then
				vis:command('set expandtab off')
			end
		end
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
