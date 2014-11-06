
# StepMania default theme

This is a repo to track only (the `Themes/default` directory within the `stepmania` project)[https://github.com/stepmania/stepmania/tree/master/Themes/default]. The idea is to be able to fork this repo, create a `default`-based theme, and then be able to observe the relative changes made and merge in improvements made to `default` as they are added.

# How to use

Fork this repo, change some things, replace this `README.md` with something relevant to your theme, and—this is important—credit the original authors!

# Authors and License

This repo consists solely of content created/aggregated by the authors of (the `stepmania` project)[https://github.com/stepmania/stepmania]. Please refer to that project for licensing details.

# Keeping this repo updated

This is a script I made up to grab the most recent version from `stepmania`'s `master` branch, clone the important parts into this repo, and check it in. I will need to run this periodically.

	#!/bin/bash

	# Locations
	export DT_UPSTREAM_URL=https://github.com/stepmania/stepmania.git
	export DT_UPSTREAM_DIR="$HOME/src/stepmania-default-theme_upstream"
	export DT_UPSTREAM_SUBDIR="Themes/default/"
	export DT_ORIGIN_URL=git@github.com:psmay/stepmania-default-theme.git
	export DT_ORIGIN_DIR="$HOME/prj/stepmania-default-theme"

	echo "$DT_UPSTREAM_DIR"

	firsttime () {
		# Create the proto-repo
		git init "$DT_UPSTREAM_DIR" &&
		(
			cd "$DT_UPSTREAM_DIR" &&
			git remote add origin "$DT_UPSTREAM_URL" &&
			git config core.sparsecheckout true &&
			echo "$DT_UPSTREAM_SUBDIR" >> .git/info/sparse-checkout
		)

		# Clone this repo
		git clone -b master "$DT_ORIGIN_URL" "$DT_ORIGIN_DIR"
	}

	everytime () {
		# Update the proto-repo
		(
			cd "$DT_UPSTREAM_DIR" &&
			git pull origin master &&
			git clean -f -d -x
		)

		# Replace this repo's files with the proto-repo
		rsync -avz \
			--exclude README.md \
			--exclude .git \
			--delete "$DT_UPSTREAM_DIR/$DT_UPSTREAM_SUBDIR" "$DT_ORIGIN_DIR/"

		# Check it in
		(
			cd "$DT_ORIGIN_DIR" &&
			git add -A &&
			git commit
		)

		# And, if it seems right at this point, push it.
	}

	# firsttime
	everytime
