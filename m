From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 21:47:47 +0100
Subject: [Buildroot] [PATCH v2] python-posix-ipc: new package
In-Reply-To: <1389155134-14506-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Tue, 7 Jan 2014 22:25:34 -0600")
References: <1389155134-14506-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87ha992ah8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 > This patch is based on the original new pkg patch submitted last Jan
 > and is part of the "Patchwork oldest patches cleanup #5".  It combines
 > the original "[1/2]/[2/2] new package: python-posix_ipc" patch files.

 > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
 > ---
 > Changes v1 -> v2:
 >  - Added depends on BR2_TOOLCHAIN_HAS_THREADS (Suggested by Thomas P)
 >    (used for critical section calls, mutex/etc...)
 >  - Fixed license to be BSD-3c, important to note the pkg website
 >    lists BSD-2c.  (Suggested by Thomas P)

Committed, thanks.

-- 
Bye, Peter Korsgaard
