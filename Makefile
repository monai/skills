USER_CODEX_DIR := $(or $(CODEX_HOME),$(HOME)/.codex)
ESSENTIALS_AGENTS := $(wildcard plugins/essentials/agents/*.md)

USER_PI_DIR := $(or $(PI_CODING_AGENT_DIR),$(HOME)/.pi/agent)

.PHONY: install

install:
	rm -rf $(USER_CODEX_DIR)/agents
	mkdir -p $(USER_CODEX_DIR)/agents
	$(foreach f,$(ESSENTIALS_AGENTS),awk -v name=$(basename $(notdir $(f))) -v models=plugins/essentials/skills/essential-mode/models.tsv -f plugins/scripts/agent-to-toml.awk $(f) > $(USER_CODEX_DIR)/agents/$(basename $(notdir $(f))).toml || exit 1;)

	rm -rf $(USER_PI_DIR)/skills
	mkdir -p $(USER_PI_DIR)/skills
	mkdir -p $(USER_PI_DIR)/skills/essentials
	tar -C plugins/essentials/skills -cf - . | tar -C $(USER_PI_DIR)/skills/essentials -xf -
