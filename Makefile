all:
	rm -f output.sqlite*
	r2 -B 0x400000 -i diaphora_r2.py /bin/ls
	#r2 -i diaphora_r2.py /bin/ls
	echo 'select edges from functions;' | sqlite3 output.sqlite | grep -v 0
