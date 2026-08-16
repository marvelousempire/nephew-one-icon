SHELL := /bin/bash

.PHONY: help verify

help:
	@printf "\nNephew One Icon\n\n"
	@printf "  make verify    Verify canonical identity and generated attire assets\n"

verify:
	@bash ./scripts/verify-attire.sh
