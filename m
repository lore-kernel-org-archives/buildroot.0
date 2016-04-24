From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 10:32:11 +0200
Subject: [Buildroot] [PATCH v4 0/7] Support building a second Barebox
 config (incl. BBB)
In-Reply-To: <20160424101653.4d8d78c5@free-electrons.com>
References: <CAGm1_kughQAzmdbaQo4bBb4+-a1rL9-1aZunOCuLtFH4pgSUhA@mail.gmail.com>
 <20160421132905.7c271814@free-electrons.com>
 <20160423130141.GB10355@smipidev>
 <20160423151129.479c5f03@free-electrons.com>
 <CAPho-_Kvdg37hhfujbg99BVwhP+jPcwnsZUH2=3G7qt0CVz7yw@mail.gmail.com>
 <20160423165013.10739b58@free-electrons.com>
 <20160423161844.GA9825@smipidev>
 <20160423212646.5e6d8f52@free-electrons.com>
 <20160424080407.GB3082@smipidev>
 <20160424101653.4d8d78c5@free-electrons.com>
Message-ID: <20160424083211.GA2129@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Apr 24, 2016 at 10:16:53AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Apr 2016 10:04:07 +0200, Pieter Smith wrote:
> 
> > I will post the patch series including the beaglebone_barebox_defconfig. This
> > will at least illustrate usage, even if it only lives in the mailing archives.
> > Should it be required: The buildroot maintainers have my permission to merge
> > only a sub-set of the patch-series. I do not object to this, and I will make it
> > clear in the summary.
> 
> It is in any case very useful to include a defconfig in the series to
> ease testing. Another possibility is to include the defconfig used for
> testing inside one of the commit log, so that it remains part of the
> Git history, and easily available if one looks at the Git commits
> touching the barebox package.

Augment the last message in the series with the defconfig? Easy enough. Will be
in v5. Or would you like something fancy (E.g. empty commit)?

> > > My grand plan is to promote something like
> > > https://github.com/tpetazzoni/buildroot-runtime-test in order to
> > > collect test cases (both build-time tests and runtime tests).
> > 
> > Promising. I will remember to have a look at it in a few weeks.
> 
> Well, don't hold your breath: I haven't touched it for months :/
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
