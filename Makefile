

locate.db = ~/.locate.db

my-locate:
	locate -d $(locate.db) -b -i

my-updatedb:
	updatedb -l 0 -o $(locate.db) -U ~/


