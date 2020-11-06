From: Matteo Pampolini <matteo.pampolini@gmail.com>
Date: Fri, 6 Nov 2020 18:13:16 +0100
Subject: [Buildroot] Enable gcc ADA support on latest LTS Buildroot
In-Reply-To: <20201106150707.18266cd7@windsurf.home>
References: <CAEzkdfrXmUQc7N7a+j2zHayLLdzoUAy5kncQmewOwQ0-fSGVGA@mail.gmail.com>
 <20201103113528.1f8e61a5@windsurf>
 <CAEzkdfp62Jz6KT5yUbrsOpoFqdCNtdOpSsYeVPUfrzExh=L__g@mail.gmail.com>
 <20201106150707.18266cd7@windsurf.home>
Message-ID: <CAEzkdfprN01emHq7D0Rdr0o-VHutP_mNMPZXvW9EQCBTqLtUUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

many thanks for your feedback, well actually I just installed the packages
provided for Ubuntu 18.04 LTS, I never had any issues
with Buildroot packages on it, but following your suggestion I will
investigate more and let you know.

Have a nice weekend,

Matteo



On Fri, Nov 6, 2020 at 3:07 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue, 3 Nov 2020 18:07:52 +0100
> Matteo Pampolini <matteo.pampolini@gmail.com> wrote:
>
> > many thanks for your quick answer, please find attached 2 logs obtained
> > with Buildroot 2020.02.6 setting gcc options to --enable-languages="ada",
> > one refers to gcc 8.x and the other one to gcc 9.x, they both fail. Build
> > system is Ubuntu 18.04.5 LTS with GNAT installed.
>
> Since I'm not familiar with ADA support in general, I don't really much
> to say about the errors you're facing, it would require more
> investigation.
>
> Are you sure the GNAT version you have installed matches / is suitable
> for building those versions of gcc ? I guess you've done some Google
> search and/or asked gcc folks about those issues ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201106/e76c9e43/attachment.html>
