
# StepMania default theme

This is a repo to track only [the `Themes/default` directory within the `stepmania` project](https://github.com/stepmania/stepmania/tree/master/Themes/default). The idea is to be able to fork this repo, create a `default`-based theme, and then be able to observe the relative changes made and merge in improvements made to `default` as they are added.

# How to use

Fork this repo, change some things, replace this `README.md` with something relevant to your theme, and—this is important—credit the original authors!

# Authors and License

This repo consists solely of content created/aggregated by the authors of [the `stepmania` project](https://github.com/stepmania/stepmania). Please refer to that project for licensing details.

# Keeping this repo updated

This is a script I made up to grab the most recent version from `stepmania`'s `master` branch, clone the important parts into this repo, and check it in. I will need to run this periodically.

	#!/bin/bash

	# Locations

	# The "parent" repo is just the stepmania/stepmania repo. Our local clone of
	# this repo will be configured as a sparse checkout configured to check out
	# only the Themes/default part.
	parent_url=https://github.com/stepmania/stepmania.git
	parent_branch=master
	parent_dir="$HOME/src/stepmania-default-theme_parent"
	parent_subdir="Themes/default/"

	# The "theme" repo is the psmay/stepmania-default-theme repo. Its basic
	# layout is intended to mimic what would happen if you checked out the
	# parent repo, copied its Themes/default to a new location, and started a
	# new repo inside that copy.
	theme_url=git@github.com:psmay/stepmania-default-theme.git
	theme_dir="$HOME/prj/stepmania-default-theme"
	theme_branch=master

	bq='`'

	# To be run the first time; sets up local checkouts
	initial_setup () {
		# Create the parent repo.
		git init "$parent_dir" &&
		(
			cd "$parent_dir" &&
			git remote add origin "$parent_url" &&
			git config core.sparsecheckout true &&
			echo "$parent_subdir" >> .git/info/sparse-checkout
		) &&

		# Clone the theme repo.
		git clone -b "$theme_branch" "$theme_url" "$theme_dir"
	}

	# To be run at least every time the theme is updated in the parent
	update () {
		# Update the parent repo
		(
			cd "$parent_dir" &&
			git pull origin "$parent_branch" &&
			git clean -f -d -x
		) &&

		# Replace theme repo's files with the parent repo
		rsync -avz \
			--exclude README.md \
			--exclude .git \
			--delete "$parent_dir/$parent_subdir" "$theme_dir/" &&

		# Think of a commit message
		current_date="`date -u -Iseconds`" &&
		commit_msg="Refreshed from $bq$parent_url$bq @ $bq$current_date$bq" &&

		# Check in and push the changes
		# (If nothing changed, no commit will occur)
		(
			cd "$theme_dir" &&
			git add -A &&
			git commit -m "$commit_msg" &&
			git push
		)
	}

	# initial_setup &&
	update

