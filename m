From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 20:09:02 +0100
Subject: [Buildroot] [PATCH] ci20_defconfig: remove
	BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
In-Reply-To: <1417448260-23029-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 1 Dec 2014 15:37:40 +0000")
References: <1417448260-23029-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87sigzfar5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > We had this option in the defconfig because the kernel defconfig we
 > provide doesn't have CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT, so a
 > /dev management which creates the devices dynamically using only
 > devtmpfs would not work. However, CONFIG_DEVTMPFS and
 > CONFIG_DEVTMPFS_MOUNT are automatically added to the kernel config when
 > you build the kernel using Buildroot, except when you choose
 > BR2_ROOTFS_DEVICE_CREATION_STATIC as a /dev management. This is handled
 > by linux/linux.mk.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
