From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 23:12:50 +0200
Subject: [Buildroot] [PATCH 1/4] mkpimage: new host package
In-Reply-To: <20151019210610.GG3651@free.fr>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
 <1445271894-22553-2-git-send-email-viktorin@rehivetech.com>
 <CAGduivyRx81uOHiT=JVj2=1iUw9jCQhgxUbqAxBJR0Wu9GVVtg@mail.gmail.com>
 <20151019225310.5cf90a28@free-electrons.com>
 <20151019210610.GG3651@free.fr>
Message-ID: <20151019231250.1e08ba2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Oct 2015 23:06:11 +0200, Yann E. MORIN wrote:

> Or we can eventually look at the Go package that was submitted a while
> back, and to which I contributed:
>     https://patchwork.ozlabs.org/patch/502222/
> 
> ;-)

Well, if we can avoid building a compiler just to build a 300 lines Go
program, it'd be great :)


> > I agree. Unfortunately, downloading directly
> > http://git.pengutronix.de/?p=barebox.git;a=blob_plain;f=scripts/socfpga_mkimage.c;h=$(MKPIMAGE_VERSION);hb=HEAD
> > doesn't work because this URL contains ';' which our download
> > infrastructure doesn't like much.
> > 
> > However, this program is so simple that I would advocate taking the
> > makedevs route: simply integrate the program source code itself inside
> > Buildroot, in package/mkpimage/.
> 
> Yup, agreed.

So Jan, can you rework your submission in this direction?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
