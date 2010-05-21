From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Fri, 21 May 2010 11:01:26 +0100
Subject: [Buildroot] Building DirectFB kernel module
Message-ID: <AB12B32E73474741A2C5361C433A44DE01C755FC@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm new to Buildroot and think I'll use it for a BSP I'm working on. I've
added a few packages that are specific to us and it's going pretty well.

However, for DirectFB I need to build a kernel module (sh772x gfx). The
source for this is included in the DirectFB tarball. At the moment, I'm
building the kernel and this module after building everything else with
Buildroot.

I'm not sure how to add an additional build step for this. Is there an
existing BR package that does something similar?

The alternative would be a new package for this, but then how do I get it to
operate on the source from the DirectFB package?

Thanks
Phil
