From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 27 Mar 2017 01:02:52 +0200
Subject: [Buildroot] [git commit] xenomai: bump version to 3.0.3
In-Reply-To: <20170326213845.279e722b@free-electrons.com>
References: <20170325181551.035B88226E@busybox.osuosl.org>
 <20170326123433.GL22954@waldemar-brodkorb.de>
 <20170326213845.279e722b@free-electrons.com>
Message-ID: <20170326230252.GM22954@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 26 Mar 2017 14:34:33 +0200, Waldemar Brodkorb wrote:
> 
> > is this well tested?
> > Simple uClibc-ng for ARM breaks with:
> > obstack.c:103:24: fatal error: exitfail.h: No such file or directory
> 
> I did do a build test (since I added a patch to make things build
> properly), but I don't remember if it was a glibc or uClibc build.
> Apparently, it was a glibc build.
> 
> > I am not an Xenomai expert, just started experimenting with it, but
> > I see no option to switch between "cobalt" and "mercury" mode.
> 
> $ ./configure --help
> [...]
>   --with-core=<cobalt | mercury>
>                           build for dual kernel or single image
> 

I mean a switch inside buildroot. But I have seen your comment now,
that it might be added later.

best regards
 Waldemar
