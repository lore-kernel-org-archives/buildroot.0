From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:11:53 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
In-Reply-To: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com> (Leon
 Anavi's message of "Fri, 29 Jun 2018 12:23:10 +0300")
References: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
Message-ID: <871sbzccye.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Leon" == Leon Anavi <leon.anavi@konsulko.com> writes:

 > Increase the filesystem size for raspberrypi3 by setting
 > BR2_TARGET_ROOTFS_EXT2_SIZE to "120M". The filesystem for
 > raspberrypi3_64 has the same size.

 > Fixes:
 > Copying files into the device: __populate_fs: Could not allocate block
 > in ext2 filesystem while writing file "services"
 > mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system

 > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
