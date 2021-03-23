all: octave.log
	$(eval OCTAVETABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(OCTAVETABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)


octave.log: t1_octave.m
	octave $< > $@

clean:
	@rm -f octave.log octave-workspace *.eps *~

.PHONY: clean
