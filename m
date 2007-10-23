From: Jorge S. <jorgesolla@gmail.com>
Date: Tue, 23 Oct 2007 13:51:19 +0200
Subject: [Buildroot] How to use sysroot option
In-Reply-To: <3696f1df0710221122i6851d53es5eb1fbf6ddd60d79@mail.gmail.com>
References: <3696f1df0710221122i6851d53es5eb1fbf6ddd60d79@mail.gmail.com>
Message-ID: <6090c5eb0710230451k35a1d5bbtefa438a903ce4d1c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is under the "TOOLCHAIN" option menu

GCC compiler Version (gcc 4.2.1)
--->
 [*] Enable toolchain with --sysroot support


2007/10/22, Andy Olsen <codewarmonkey@gmail.com>:
>
> In the documentation on buildroot, it indicates that you can build
> cross-compiled toolchain that can be moved out of the staging_dir into
> another directory. I am using gcc 4.2.1. When I look at the options in
> make menuconfig, I am not seeing where I should put the sysroot option. Can
> someone point me in the right direction? I have searched this mailing list
> but didn't find anything to help me with this.
>
> Thanks.
>
> Andy
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071023/c433feec/attachment.htm 
