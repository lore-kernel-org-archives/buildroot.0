From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Mar 2012 11:48:25 +0100
Subject: [Buildroot] u-boot .img rootfs
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F41FF555E5@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F001F41FF555E5@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20120306114825.353855b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 5 Mar 2012 20:00:57 -0600,
H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :

> I have been using Buildroot to create a rootfs.ext2.gz that works
> great with RedBoot.
> 
> I have a new board that uses U-Boot as the bootloader and it wants
> some kind of .img file for the rootfs.  Can this be created using
> Buildroot? Do I need to do something after the rootfs.ext2.gz is
> created to make the .img file?

Do you have more details, because .img is very generic. Do you have a
pointer to your specific U-Boot configuration? Can you just show why
you think U-Boot needs such as file?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
