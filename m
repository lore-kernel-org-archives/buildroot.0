From: Arun Reddy <reddyac@gmail.com>
Date: Mon, 19 May 2008 17:34:04 -0700
Subject: [Buildroot] Bootloaders
In-Reply-To: <4831FE20.6050508@dspfl.com>
References: <4831FE20.6050508@dspfl.com>
Message-ID: <326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jason,

I am new to Buildroot as well. I have successfully created an x86 target
with Grub as the bootloader. I was wondering if the error you're getting
says something about not being able to resolve the debian ftp site? Are you
able to even download grub from the correct repository first? I just want to
know if it's a compiling problem or a problem with retrieving grub. If it's
the latter than the problem lies within the actual Makefile, in that the
repository is broken and you need to change the path for your development
system to go grab it from.

I wish I could help with your U-boot problem, but for now I am struggling
just to get an ARM build done so I can test it out on QEMU (an emulator
which I can use to serve as my ARM bootloader). I will soon need to build
u-boot as well so if anyone responds to your questions it would be helping
me out as well in the future.

On Mon, May 19, 2008 at 3:24 PM, Jason Valenzuela <jvalenzuela@dspfl.com>
wrote:

> Trying to get my first root fs ready to boot and I can't seem to get any
> of the bootloaders to compile.
>
> Grub complains about not finding a specific patch on the debian ftp site.
>
> syslinux complains while building to the tune of
> "as: option '-alternate' doesn't allow an argument." This is the 'as'
> that is provided in my default i486 slackware host system.
>
> U-boot dies with *** No rule to make target `_config'.
>
> pxelinux I haven't tried as my target host isn't going to be on a network.
>
> Am I missing something stupid?
>
> Thanks,
> Jason Valenzuela
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080519/7a216a5c/attachment.htm 
