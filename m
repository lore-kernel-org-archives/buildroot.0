From: Francisco Gonzalez <gzmorell@gmail.com>
Date: Sun, 11 Oct 2009 16:45:42 +0200
Subject: [Buildroot] How to use gcc-4.1.1 with buildroot
In-Reply-To: <370185.76895.qm@web58207.mail.re3.yahoo.com>
References: <370185.76895.qm@web58207.mail.re3.yahoo.com>
Message-ID: <fffd86390910110745l55d5837ege518dc66e9b561f5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/10/10 Sushil Kumar <sushil_tux@yahoo.com>

>
> Question: Please suggest me how to compile buildroot using gcc-4.1.1
> compiler.  Is it possible?
>

Follow:
$ make menuconfig
-> In "Build Options"
Activate:
[*] Show packages that are deprecated or obsolete.

-> In "Toolchain"
-> In "GCC compiler Version"
should appear the "4.1.2" version.
I do not know if that version fits your needs.



>
> Thanks for your help.
>
> Sushil
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091011/60bf55f7/attachment.htm>
