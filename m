From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jul 2010 08:28:16 +0200
Subject: [Buildroot] makedevs: line 49: regular file (...)
 buildroot/output/target/usr/share/udhcpc/default.script does not exist: No
 such file or directory
In-Reply-To: <1280116089.28885.29.camel@segulix>
References: <1280116089.28885.29.camel@segulix>
Message-ID: <20100726082816.7a1bd8d1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Jul 2010 04:48:09 +0100
Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:

> I got this error too , with buildroot-2010.05.

Which error ?

> After read some threads in this mailing list is this some error , 
> to work around I done:
> cd output/target/usr/share
> ln -s ../../../../target/generic/target_skeleton/usr/share/udhcpc
> 
> and build rootfs , is this correct ? the target is a mips32r2 . 

Maybe, but as you haven't copy/pasted the error, it's hard to say :-)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
