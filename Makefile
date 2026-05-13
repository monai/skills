SKILLS_DIR := skills
SKILLS := $(notdir $(patsubst %/,%,$(wildcard $(SKILLS_DIR)/*/)))
TARGET_DIRS := $(HOME)/.agents/skills $(HOME)/.claude/skills
LINK_TARGETS := $(foreach target_dir,$(TARGET_DIRS),$(addprefix $(target_dir)/,$(SKILLS)))
UNLINK_TARGETS := $(addsuffix .unlink,$(LINK_TARGETS))

.PHONY: install uninstall list

install: $(LINK_TARGETS)

uninstall: $(UNLINK_TARGETS)

list:
	@printf '%s\n' $(SKILLS)

$(TARGET_DIRS):
	@mkdir -p "$@"

$(HOME)/.agents/skills/%: $(SKILLS_DIR)/% | $(HOME)/.agents/skills
	@if [ -e "$@" ] && [ ! -L "$@" ]; then \
		echo "Skipping $@: exists and is not a symlink"; \
	else \
		ln -sfn "$(CURDIR)/$<" "$@"; \
		echo "Linked $@ -> $(CURDIR)/$<"; \
	fi

$(HOME)/.claude/skills/%: $(SKILLS_DIR)/% | $(HOME)/.claude/skills
	@if [ -e "$@" ] && [ ! -L "$@" ]; then \
		echo "Skipping $@: exists and is not a symlink"; \
	else \
		ln -sfn "$(CURDIR)/$<" "$@"; \
		echo "Linked $@ -> $(CURDIR)/$<"; \
	fi

%.unlink:
	@if [ -L "$*" ]; then \
		rm "$*"; \
		echo "Removed $*"; \
	fi
