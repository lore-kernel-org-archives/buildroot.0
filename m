From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 19:29:48 +0100
Subject: [Buildroot] [PATCH] libsoc: fix MUSL build issue
In-Reply-To: <1448638281-1170-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Fri, 27 Nov 2015 16:31:21
 +0100")
References: <1448638281-1170-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87lh9jqorn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Without <linux/ioctl.h> include compiler cannot find _IOC_SIZEBITS
 > macro, when using MUSL C library.

 > Fixes:
 >   http://autobuild.buildroot.net/results/c86/c86fc75212df75906222772854c283396bb880d2/

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
