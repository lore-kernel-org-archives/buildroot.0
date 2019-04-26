From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:43:07 +0200
Subject: [Buildroot] [git commit]
 configs/atmel_sama5d27_som1_ek_mmc_dev: increase rootfs image size
In-Reply-To: <20190421123714.A6C9C81453@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 21 Apr 2019 14:40:47 +0200")
References: <20190421123714.A6C9C81453@busybox.osuosl.org>
Message-ID: <875zr10wf8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ce751fad37b78bb658ea6532bee3b49ea523aa73
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The default rootfs image size is too small, causing the following
 > build failure:

 > Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "udevd"
 > mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system
 > *** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)

 > So we increase it to 120 MB.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339415

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
