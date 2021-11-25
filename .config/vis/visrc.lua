require('vis')

vis.events.subscribe
(
    vis.events.WIN_OPEN,

    function(win)
	   vis:command('set numbers on')
	   vis:command('set autoindent on')
	   vis:command('set tw 4')
	   vis:command('set et')
    end
)
