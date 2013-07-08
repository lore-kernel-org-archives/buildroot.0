From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 8 Jul 2013 22:12:10 +0800
Subject: [Buildroot] How to rebuild root filesystem?
In-Reply-To: <20130708102732.46a8b87d@skate>
References: <20130708045657.GA29211@zuhnb712.ap.bm.net>
 <20130708102732.46a8b87d@skate>
Message-ID: <20130708141210.GA11258@zuhnb712>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 08, 2013 at 10:27:32AM +0200, Thomas Petazzoni wrote:
> Dear Woody Wu,
> 
> On Mon, 8 Jul 2013 12:56:58 +0800, Woody Wu wrote:
> 
> > Since things in my output/target got messed, hence I want to rebuild
> > everything in that directory and recreate the root filesystem image. How
> > can I ask buildroot to do it?
> > 
> > I knew that 'make clean' and 'make' will do it. But, my external
> > toolchain also get rebuilt, that can take very long time.
> 
> No, if you're using an external toolchain, it does *not* gets rebuilt
> every time you do make clean && make. It's the whole point of using an
> external toolchain.
> 

okay, may be it tooks too long time to make me think it was building the
toolchain, maybe it was just building the kernel. Whatever.

When I said external toolchain, I actually's talking about Code Sourery
which can be selected from buildroot toolchain configuration menu. Maybe
she's now so external.

Anyway, for my real question, is there a solution? How to reuild the
root filesystem from scratch.  Thanks!

-
woody
