all: c.sqlite
	#echo 'select * from results;' | sqlite3 c.sqlite | column -s '|' -t
	( echo '.mode column'; echo '.headers on' ; echo 'select * from results;' )| sqlite3 c.sqlite

c.sqlite: a.sqlite b.sqlite
	python ../diaphora.py -o c.sqlite a.sqlite b.sqlite

a.sqlite: a.c
	$(CC) a.c -o a
	python ../diaphora_r2.py a
	mv output.sqlite a.sqlite

b.sqlite: b.c
	$(CC) b.c -o b
	python ../diaphora_r2.py b
	mv output.sqlite b.sqlite

clean:
	rm -f a b a.sqlite b.sqlite c.sqlite
