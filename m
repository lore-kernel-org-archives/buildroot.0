From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 15:22:49 +0200
Subject: [Buildroot] [PATCH v2] package/ascii-invaders: Add the game
 ascii-invaders
In-Reply-To: <20190422081125.6659-1-huth@tuxfamily.org> (Thomas Huth's message
 of "Mon, 22 Apr 2019 10:11:25 +0200")
References: <20190422081125.6659-1-huth@tuxfamily.org>
Message-ID: <87imrecriu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Huth <huth@tuxfamily.org> writes:

 > An ASCII-art game like Space Invaders using ncurses.
 > Signed-off-by: Thomas Huth <huth@tuxfamily.org>
 > ---
 >  v2:
 >  - I'm submitting the patch individually now, to ease the review
 >  - Addressed Gilles' review feedback from v1
 >  - Cleaned warnings from utils/check-package
 >  - Checked with utils/test-pkg, added POST_EXTRACT_HOOK to fix a problem
 >    when linking the program statically
 >  - Use $(call github, ...) helper to create the SITE variable

Cute ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
