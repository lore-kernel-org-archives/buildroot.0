From: Matteo Pampolini <matteo.pampolini@gmail.com>
Date: Tue, 3 Nov 2020 18:07:52 +0100
Subject: [Buildroot] Enable gcc ADA support on latest LTS Buildroot
In-Reply-To: <20201103113528.1f8e61a5@windsurf>
References: <CAEzkdfrXmUQc7N7a+j2zHayLLdzoUAy5kncQmewOwQ0-fSGVGA@mail.gmail.com>
 <20201103113528.1f8e61a5@windsurf>
Message-ID: <CAEzkdfp62Jz6KT5yUbrsOpoFqdCNtdOpSsYeVPUfrzExh=L__g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

many thanks for your quick answer, please find attached 2 logs obtained
with Buildroot 2020.02.6 setting gcc options to --enable-languages="ada",
one refers to gcc 8.x and the other one to gcc 9.x, they both fail. Build
system is Ubuntu 18.04.5 LTS with GNAT installed.

Regards,

Matteo

On Tue, Nov 3, 2020 at 11:35 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Matteo,
>
> On Tue, 3 Nov 2020 08:53:48 +0100
> Matteo Pampolini <matteo.pampolini@gmail.com> wrote:
>
> > I would like to enable ADA language to gcc together with the needed
> target
> > libraries, I'm using the latest LTS version of Buildroot. I saw an email
> > with a patch some years ago but it seems it was never put into the
> > Buildroot mainline. I tried just setting --enable-languages=ada in gcc
> > options but it fails, both gcc 8.x and 9.x.
>
> Could you give details about the failures you're seeing ?
>
> > May you please help me? Why is there no such configuration option just
> like
> > Fortran or D?
>
> Because nobody really pushed for that, but if you do so, we will be
> happy to include support for building gcc with Ada support. It
> certainly makes sense to have that in Buildroot.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201103/d381f2ee/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc9-ada.log
Type: text/x-log
Size: 19603 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201103/d381f2ee/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc8-ada.log
Type: text/x-log
Size: 32437 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201103/d381f2ee/attachment-0001.bin>
