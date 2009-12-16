From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Dec 2009 19:43:27 +0100
Subject: [Buildroot] Did output/staging change to
	output/build/staging_dir?
In-Reply-To: <hgb6iv$iue$1@ger.gmane.org> (Grant Edwards's message of "Wed, 16
	Dec 2009 17:49:19 +0000 (UTC)")
References: <hgb6iv$iue$1@ger.gmane.org>
Message-ID: <878wd27oa8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> Should I update the docs to reflect the fact that
 Grant> output/staging has apparently moved to output/build/staging_dir?

No it hasn't (that's the old location). What might be happening is that
you are using an old .config with
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir".

-- 
Bye, Peter Korsgaard
