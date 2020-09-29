From: daggs <daggs@gmx.com>
Date: Tue, 29 Sep 2020 14:31:25 +0200
Subject: [Buildroot] [PATCH] dvb-apps: fix build failure with glibc 2.31
In-Reply-To: <20200928212227.0daf8624@windsurf.home>
References: <20200926095550.27437-1-daggs@gmx.com>
 <20200926153910.009ca5ed@windsurf.hq.k.grp>
 <trinity-191718b2-1823-476c-b87e-3f66019aba4b-1601136385289@3c-app-mailcom-bs14>
 <20200928212227.0daf8624@windsurf.home>
Message-ID: <trinity-293ff829-b3f4-4c77-826a-1e8fc810bfdd-1601382685330@3c-app-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Monday, September 28, 2020 at 10:22 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "daggs" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] dvb-apps: fix build failure with glibc 2.31
>
> Hello,
>
> On Sat, 26 Sep 2020 18:06:25 +0200
> daggs <daggs@gmx.com> wrote:
>
> > > Fixes:
> > >
> > >   http://autobuild.buildroot.net/results/95f30c5e6af2274418bb44a20da7caac69f1dd68/
> >
> > frankly speaking, I had no idea this issue was marked by the
> > autobuilder, I've encountered it when trying to build an image with
> > dvb-apps installed.
>
> No problem. But when you have a failure, it makes sense to check if we
> have encountered it in the autobuilders. You can easily search by doing
> this:
>
> 	http://autobuild.buildroot.org/?reason=dvb-apps%
>
> The % at the end is important, as it acts as a wildcard.
>
> And if the failure was not found by the autobuilders, it is interesting
> to investigate why. Is it because the failure is related to a very
> specific system configuration? Or an architecture/toolchain combination
> we are not testing?
>

I'll take that under advisement for the future

Dagg
