install:
	@ls -d1 */ | grep -v scripts | xargs stow -vv
