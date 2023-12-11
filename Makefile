DTC      = dtc
DTCFLAGS = -@ -I dts -O dtb
OVERLAYS = sleepi3.dtbo

all: $(OVERLAYS)

sleepi3.dtbo: sleepi3.dts

%.dtbo: %.dts
	$(DTC) $(DTCFLAGS) -o $@ $<

install: $(OVERLAYS)
	install -d $(DESTDIR)/boot/firmware/overlays
	install -m 644 $(OVERLAYS) $(DESTDIR)/boot/firmware/overlays

clean:
	rm -f *.dtbo
