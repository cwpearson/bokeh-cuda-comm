
TARGETS =

CSV_FILES =

GEN_DIR = generated


YMLS = $(wildcard figure-specs/*.yml)
HTML = $(patsubst figure-specs/%.yml, $(GEN_DIR)/%.html, ${YMLS})
TARGETS += $(HTML)

all: $(TARGETS)

$(GEN_DIR):
	[ -d $(GEN_DIR)] || mkdir -p $(GEN_DIR)

$(GEN_DIR)/%.html: figure-specs/%.yml $(GEN_DIR) python/plot.py
	python3 python/plot.py $@ $<

clean:
	rm -f $(TARGETS) $(GEN_DIR)/*.html