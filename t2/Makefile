# ------------------------------------------------------------
# type "make" command in the Linux terminal create report.pdf
#
# type "make clean" to delete all generated files
# ------------------------------------------------------------

all:
	make -C mat
	make -C sim1
	make -C sim2
	make -C sim3
	make -C sim4
	make -C sim5
	make -C doc
	cp doc/report.pdf .

clean:
	make -C mat clean
	make -C sim1 clean
	make -C sim2 clean
	make -C sim3 clean
	make -C sim4 clean
	make -C sim5 clean
	make -C doc clean

.PHONY: all clean


