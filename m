From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 14:23:03 +0200
Subject: [Buildroot] [PATCH] icu: propagate host gcc dependency to
	reverse dependencies
In-Reply-To: <20170703211859.6696-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 3 Jul 2017 23:18:59 +0200")
References: <20170703211859.6696-1-peter@korsgaard.com>
Message-ID: <87o9t02xy0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/821/821eae7add252e3711ed069a2d292a04427fa43b/

 > Commit 87f43c3403 (package/icu: needs host gcc >= 4.8) added a new toolchain
 > dependency to icu, but didn't propagate it to the reverse dependencies of
 > icu.

 > Some of these have been fixed in later commits, but not all.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
