From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Mon, 29 Jun 2009 15:54:13 -0000 (Europe/London)
Subject: [Buildroot] ssh
Message-ID: <60114.172.16.221.10.1246290853.squirrel@172.16.0.251>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




sorry for my ignorance on this

I did make menuconfig
selected dropbear and x64
saved and did a make
looked at the
ext2 it created with mount -o loop file /mnt

all was good
except no libgcc installed, so I have added and now done a strip -s on
it
now down to 74k form 300k

should it not of installed it
and stripped it for me I checked and I have checked

Build/install a shared libgcc

thanks

Nick

> Le Sun, 28 Jun 2009 21:36:56 -0000 (Europe/London),
>
nfrench at xtale.biz a ??crit :
> 
>> just
booted and have a problem with ssh (dropbear) that it needs
>>
libgcc_s.so and this is not int the image
> 
> Which
Buildroot mode are you using ? Buildroot toolchain or external
>
binary toolchain ?
> 
>> I could copy the one from the
build of gcc but thats >300k do I need
>> to change some
thing in the build options.
> 
> Here on ARM, my
libgcc_s.so.1 unstripped is ~175K, and stripped, it is
> ~42K.
> 
> Thomas
> --
> Thomas Petazzoni, Free
Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
>
http://free-electrons.com
>
_______________________________________________
> buildroot
mailing list
> buildroot at busybox.net
>
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090629/e6d23b98/attachment.htm>
