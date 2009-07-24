From: loody <miloody@gmail.com>
Date: Fri, 24 Jul 2009 16:36:45 +0800
Subject: [Buildroot] error about compile gcc
In-Reply-To: <87prbrbofx.fsf@macbook.be.48ers.dk>
References: <3a665c760907230115w47500c7ai1e7a8339f01e907a@mail.gmail.com>
	<87prbrbofx.fsf@macbook.be.48ers.dk>
Message-ID: <3a665c760907240136y2c27829cq78899f6e3aac39f7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

2009/7/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "loody" == loody ?<miloody@gmail.com> writes:
>
> ?loody> Dear all:
> ?loody> I use buildroot to build mipsel toolchain and I got the error message below:
> ?loody> /media/sda6/uclinux/toolchain/mips/temp/buildroot-2009.05/build_mipsel/staging_dir/usr/include/unistd.h:243:
> ?loody> error: two or more data types in declaration specifiers
>
> ?loody> I have google the error
> ?loody> message,http://osdir.com/ml/lib.uclibc.buildroot/2007-06/msg00076.html,
> ?loody> ?but the error still exist even I use "--disable-libmudflap ".
>
> Please provide a bit more info. Could you do a clean rebuild and attach
> the (compressed) logfile together with your .config?
>
> Do something like:
>
> rm -rf *build_*
> make 2>&1 >log.txt
thanks for your kind help.
I find the problem will come out when I change the .config of uclibc.
I first "make uclibc-menuconfig" then make it with the .config I modified.

I attach the
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildRoot.zip
Type: application/zip
Size: 155783 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090724/2e12ad27/attachment-0001.zip>
