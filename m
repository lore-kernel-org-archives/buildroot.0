From: Daniel Lerch <dlerch@gmail.com>
Date: Thu, 9 Oct 2008 17:04:26 +0200
Subject: [Buildroot] openssl error
In-Reply-To: <48EE0394.90003@cetrtapot.si>
References: <88372fcb0810090151s1f9650b1u17252c27f9899d65@mail.gmail.com>
	<48EE0394.90003@cetrtapot.si>
Message-ID: <88372fcb0810090804n520b72d3hf2160d5cf7b4f802@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have enabled this option, but the problem persists.
tks
-- 
Daniel Lerch
project: www.opendomo.com
blog: h4ck1t.blogspot.com


2008/10/9 Hinko Kocevar <hinko.kocevar@cetrtapot.si>

> Daniel Lerch wrote:
> > Hi,
> >
> > I think that 'large file' params are ok:
> >
> > $ cat toolchain/uClibc/uClibc-0.9.28.config | grep "LARGE\|LFS"
> > UCLIBC_HAS_LFS=y
> > UCLIBC_HAS_FOPEN_LARGEFILE_MODE=y
> >
> >
> > Can somebody help me?
> >
>
> It think that BR2 config for LFS exists too, use menuconfig -> Toolchain ->
> Enable large file (files > 2 GB) support.
>
>
> Best regards,
> Hinko
>
> --
> ?ETRTA POT, d.o.o., Kranj
> Planina 3
> 4000 Kranj
> Slovenia, Europe
> Tel. +386 (0) 4 280 66 03
> E-mail: hinko.kocevar at cetrtapot.si
> Http: www.cetrtapot.si
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081009/8b149f4d/attachment.htm 
