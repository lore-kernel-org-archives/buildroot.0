From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 20:35:21 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: bump version to 1.43.9
In-Reply-To: <20180218215413.3656-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 18 Feb 2018 22:54:13 +0100")
References: <20180218215413.3656-1-peter@korsgaard.com>
Message-ID: <87y3joixhi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop 0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch as it
 > is now upstream.

 > Only contains minor bugfixes since 1.43.8 and no new features.

 > From the release notes:

 > Remove the huge file flag from libe2p (and hence from chattr/lsattr),
 > since it was never made visible by the kernel.  Remove the description
 > of some compression related flags, and add a description of the
 > encrypted file flag, and the project hierarchy flag.

 > Remove a misplaced "MNP is unsupported" message from debugfs.

 > Fix a build failure in lib/ext2fs/swapfs.c on big-endian systems.
 > (Addresses Debian Bug #886119)

 > Fix various Debian packaging issues.  (Addresses Debian Bug #269569).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
