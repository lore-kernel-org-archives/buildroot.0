From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2010 17:24:51 +0100
Subject: [Buildroot] Modify the name of the output image
 'rootfs.arm.ext2'
In-Reply-To: <SNT129-W65BE80962A75AA0E8E95F8B9540@phx.gbl>
References: <SNT129-W65BE80962A75AA0E8E95F8B9540@phx.gbl>
Message-ID: <20100206172451.6afccbfd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 5 Feb 2010 17:35:09 +0100
Tony Mozi <spooflinux@hotmail.fr> wrote:

> Is it possible to modify the name of the output image
> 'rootfs.arm.ext2' (which is in buildroot-2009.11/output/images) by
> 'rootfs.arm.ext2' (for example)? BR 

For ext2, see the option BR2_TARGET_ROOTFS_EXT2_OUTPUT.

For what kind of use case do you need this ? Is renaming the image
after building Buildroot a problem ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
