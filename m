From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 22:45:36 +0200
Subject: [Buildroot] [PATCH] fs/skeleton: allow rootfs not to be
	remounted read-write
In-Reply-To: <1309690563-9490-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Sun, 3 Jul 2011 12:56:03 +0200")
References: <1309690563-9490-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <8739idyidr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed with minor edit, thanks.

 Luca> +config BR2_REMOUNT_ROOTFS_RW

The other options are prefixed with TARGET_GENERIC, so I renamed it to
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW.

-- 
Bye, Peter Korsgaard
