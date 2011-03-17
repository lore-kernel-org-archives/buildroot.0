From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Thu, 17 Mar 2011 13:23:43 +0100
Subject: [Buildroot] can't load library 'libgomp.so.1'
In-Reply-To: <4D81EAE1.7090903@sensortherm.de>
References: <4D81EAE1.7090903@sensortherm.de>
Message-ID: <4D81FD4F.3020404@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

disable openmp support works too.

See my Patch.

Regards,

Klaus

Am 17.03.2011 12:05, schrieb Klaus Schwarzkopf:
> Hi,
>
> if have installed imagemagick.
>
> On my target, i have this error:
>
> # convert --version
> convert: can't load library 'libgomp.so.1'
>
>
> I copied the lib and it works:
>
> cp
> /opt/buildroot-git/output/host/usr/arm-unknown-linux-uclibcgnueabi/lib/libgomp.so.1.0.0
> ${TARGET}/usr/lib/libgomp.so.1
>
> # convert --version
> Version: ImageMagick 6.6.7-6 2011-03-17 Q16 http://www.imagemagick.org
> Copyright: Copyright (C) 1999-2011 ImageMagick Studio LLC
> Features: OpenMP
>
> Can you fix it?
>
> Regards,
>
> Klaus
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
