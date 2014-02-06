From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Feb 2014 23:06:11 +0100
Subject: [Buildroot] [PATCH 1/1] mmc-utils: fix linux headers issue
	before 3-4
In-Reply-To: <1391723722-7567-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Thu, 6 Feb 2014 22:55:22 +0100")
References: <1391723722-7567-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87ha8bnbfw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > With toolchains that include linux kernel headers before the 3.4 kernel,
 > an issue exists with linux/mmc/ioctl.h in that it doesn't include
 > linux/types.h.

 > Merged the patch with an existing patch for mmc-utils as it modifies
 > the same file and fixes similar issues. Also updated the patch to
 > conform to the buildroot patch naming standard.

 > Fixes:
 >   http://autobuild.buildroot.net/results/828/828c7a686736710c4fcb152230d0fa6b5f4d6ad3

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
