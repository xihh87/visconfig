require('vis')

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set numbers on')
end)
