From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 20:36:50 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: bump version and other fixes
In-Reply-To: <1381081945-20712-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Oct 2013 19:52:25 +0200")
References: <1381081945-20712-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwmmfdq5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit bumps ltp-testsuite to the latest version available. In
 Thomas> addition to that, it also:

 Thomas>  * Removes the ltp-testsuite-disable-controllers.patch file, which
 Thomas>    becomes useless thanks to the workaround that consists in removing
 Thomas>    -D_FILE_OFFSET_BITS=64 from the CFLAGS. This is necessary because
 Thomas>    ltp-testsuite uses the non-largefile compatible <fts.h> interface.

 Thomas>  * Marks the package as not-available on AArch64, since it doesn't
 Thomas>    build properly. A bug has been submitted upstream to the Linaro
 Thomas>    people doing the AArch64 support.

Committed, thanks.

-- 
Bye, Peter Korsgaard
