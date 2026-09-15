.PHONY: check

check:
	@for formula in Formula/*.rb; do ruby -c "$$formula" || exit; done
