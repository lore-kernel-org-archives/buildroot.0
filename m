From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 22:39:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncurses: Fix GCC 5.x
	preprocessor failure
In-Reply-To: <1432770713-18309-1-git-send-email-rdkehn@yahoo.com> (Doug Kehn's
 message of "Wed, 27 May 2015 18:51:53 -0500")
References: <1432770713-18309-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <87vbf8v5vt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Doug" == Doug Kehn <rdkehn@yahoo.com> writes:

 > Building ncurses 5.9 with GCC 5.x fails with a syntax error, caused by
 > earlier preprocessing. This failure is more likely when building for
 > host (e.g. host-ncurses) that recently updated to GCC 5.x.

 > This patch is taken from the following link (more information is also
 > available here):
 > https://groups.google.com/forum/#!topic/sage-trac/U31shviuqzk

 > Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
