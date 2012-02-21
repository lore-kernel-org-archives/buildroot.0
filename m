From: =?UTF-8?Q?=C3=89ric_ALBER?= <eric.alber@gmail.com>
Date: Tue, 21 Feb 2012 12:18:47 +0100
Subject: [Buildroot] Microperl compilation error
In-Reply-To: <CAGDZK6GbRLiJMT+4dpGWQbQYrc_W5djWR-k-ciK+v-HyG8=q0g@mail.gmail.com>
References: <CAGDZK6GbRLiJMT+4dpGWQbQYrc_W5djWR-k-ciK+v-HyG8=q0g@mail.gmail.com>
Message-ID: <CAGDZK6Ey7-GFb=CLmQ2i6Ut4Vdb2TDuihRCiZurGN3fvye9oiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forgot the buildroot version: 2012.02-rc2

2012/2/21 ?ric ALBER <eric.alber@gmail.com>

> Hello,
>
> I'm using buildroot to install a custom linux on a Seagate Dockstar
> (Marvell Kirkwood based product).
> I'm facing a compilation error on microperl, it looks like the -lm flag is
> not passed to the linker and thus all math functions are not found.
> I'm using buildroot on a Ubuntu 11.10
>
> I attach the patch that fixed the problem on my side.
>
> Regards,
>
> Eric
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120221/693d5b1e/attachment.html>
