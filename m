From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Apr 2010 22:32:15 +0200
Subject: [Buildroot] [pull request] Pull request for branch fs-fixes
In-Reply-To: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 17 Apr 2010 06:02:52 +0200")
References: <cover.1271476803.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pr1wcxio.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is the fix for bug #1537, i.e "device entries no longer
 Thomas> created". It is a severe regression introduced by my filesystem
 Thomas> cleanup code. The problem was that the TARGET_DEVICE_TABLE variable
 Thomas> was no longer defined.

 Thomas> To fix it, I took the approach I intend to take to cleanup the rest of
 Thomas> target/, i.e use normal configuration options instead of variables
 Thomas> defined in board-specific Makefiles.

 Thomas> Therefore, I've added a new BR2_ROOTFS_DEVICE_TABLE option, which
 Thomas> contains the path to the device table that should be used.

Pulled and pushed, thanks!

-- 
Bye, Peter Korsgaard
