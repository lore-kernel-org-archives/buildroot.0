From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jul 2012 09:31:03 +0200
Subject: [Buildroot] Linux throwing "uncompression error" on
 rootfs.ext2.gz ?
In-Reply-To: <4FF24364.7010303@powerstandards.com>
References: <4FF24364.7010303@powerstandards.com>
Message-ID: <20120703093103.563a1876@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 02 Jul 2012 17:57:08 -0700,
Judson Wilson <judson@powerstandards.com> a ?crit :

> Curious if anyone has run into an issue where their ext2.gz image causes 
> linux boot to say "uncompression error", like this:
> 
> ...
> RAMDISK: gzip image found at block 0
> uncompression error
> VFS: Mounted root (ext2 filesystem) on device 1:0.
> ...

Are you using this file as an initrd, or as the real root filesystem?
Could you share some details about your setup (where do you put the
ext2.gz image, what is your kernel command line, kernel configuration,
etc.).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
