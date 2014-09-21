From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 21 Sep 2014 21:50:54 +0200
Subject: [Buildroot] [PATCH 2/2] qemu-sparc: use default gcc
In-Reply-To: <20140921214552.2e289242@free-electrons.com>
References: <20140919103404.GA24103@waldemar-brodkorb.de>
 <20140921193957.77da49d4@free-electrons.com>
 <20140921193251.GU14691@waldemar-brodkorb.de>
 <20140921214552.2e289242@free-electrons.com>
Message-ID: <20140921195053.GV14691@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Sun, 21 Sep 2014 21:32:51 +0200, Waldemar Brodkorb wrote:
> 
> > > It's a bit annoying that we need a patch to the kernel to make sure
> > > that gcc can build a working kernel since it means that people not
> > > using the Qemu defconfig for SPARC builds will not get the patch.
> > > 
> > > Though the problem has been around since a long time, so if people
> > > really bothered about working SPARC support in upstream kernel/gcc,
> > > they should have complained earlier.
> > 
> > The patch was accepted by David Miller, so the problem shouldn't
> > exist in the next version of the Kernel.
> 
> Yes, I know, but it leaves earlier kernel versions broken, at least out
> of the box.
> 
> > If buildroot would have a global Linux patch directory, something
> > like this could be added meanwhile.
> 
> This clearly something that we do not want to do. See
> https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.14,
> and you'll discover why we clearly don't want to do that. My colleague
> Maxime has just spent several painful days to bump the 3.14 OpenWRT
> stack of kernel patches to 3.16, just for the sake of being able to run
> OpenWRT on a 3.16 kernel. It's just ridiculous, and that's not a
> situation where we want Buildroot to be.

Sure, I don't want that you misuse the ability for having generic
Linux kernel patches, like the OpenWrt devs do ;)

Just maybe some minimal stuff, which is queued for upstream
inclusion. But hey, it is okay for me when you don't want to start
with it.

best regards
 Waldemar
