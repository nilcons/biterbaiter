MODNAME=BiterBaiter
MODVERSION=0.1.1
TDIR=$(MODNAME)_$(MODVERSION)/
MODFILES=$(TDIR)control.lua $(TDIR)data.lua $(TDIR)info.json $(TDIR)LICENSE $(TDIR)settings.lua \
	$(TDIR)graphics/biter-baiter-shot.png $(TDIR)graphics/biter-baiter-machine-icon.png \
	$(TDIR)graphics/biter-research-icon.png \
	$(TDIR)graphics/biter-radar-idle.png \
	$(TDIR)graphics/biter-radar.png \
	$(TDIR)graphics/biter-radar-shadow.png \
	$(TDIR)graphics/hr-biter-radar-idle.png \
	$(TDIR)graphics/hr-biter-radar.png \
	$(TDIR)graphics/hr-biter-radar-shadow.png \
	$(TDIR)sounds/biter-baiter-bubbles.ogg \
	$(TDIR)locale/en/config.cfg \
	$(TDIR)README.md

all: $(MODFILES)

clean:
	rm -rf $(TDIR)
	rm -f graphics/psd/*.png

$(TDIR)%.lua: %.lua
	mkdir -p $(TDIR)
	cp $< $@

$(TDIR)info.json: info.json
	mkdir -p $(TDIR)
	sed s/VERSION/$(MODVERSION)/ <$< >$@

$(TDIR)locale/en/config.cfg: locale/en/config.cfg
	mkdir -p $(TDIR)locale/en
	cp $< $@

$(TDIR)LICENSE: LICENSE
	mkdir -p $(TDIR)
	cp $< $@

$(TDIR)README.md: README.md
	mkdir -p $(TDIR)
	cp $< $@

$(TDIR)sounds/biter-baiter-bubbles.ogg: sounds/biter-baiter-bubbles.ogg
	mkdir -p $(TDIR)sounds
	cp $< $@

$(TDIR)graphics/biter-baiter-shot.png: graphics/biter-baiter-shot.png
	mkdir -p $(TDIR)graphics
	cp $< $@

$(TDIR)graphics/biter-baiter-machine-icon.png: graphics/biter-baiter-machine-icon.png
	mkdir -p $(TDIR)graphics
	cp $< $@

graphics/psd/biter-radar-idle.png graphics/psd/biter-radar.png \
graphics/psd/biter-radar-shadow.png graphics/psd/hr-biter-radar-idle.png \
graphics/psd/hr-biter-radar.png graphics/psd/hr-biter-radar-shadow.png \
graphics/psd/biter-research-icon.png : \
  graphics/psd/convert.sh graphics/psd/hr-biter-radar.psd \
  graphics/psd/hr-biter-radar-shadow.psd graphics/psd/biter-research-icon.psd
	cd graphics/psd && ./convert.sh

$(TDIR)graphics/%.png: graphics/psd/%.png
	mkdir -p $(TDIR)graphics
	cp $< $@

$(MODNAME)_$(MODVERSION).zip: clean all
	zip -r $@ $(TDIR)

release: $(MODNAME)_$(MODVERSION).zip
