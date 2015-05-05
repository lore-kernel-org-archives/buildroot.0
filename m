From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 10:10:21 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
 3.10.17-1.0.1
In-Reply-To: <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>
 <20150504151227.GC11312@kwain>
 <20150504171543.68eb13fc@free-electrons.com>
 <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
Message-ID: <20150505101021.09a0a96e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

On Tue, 5 May 2015 10:06:11 +0200, Gary Bisson wrote:

> > J?r?me, Gary, would you be able to test the new version of the GPU
> > drivers, and see if they work with both 3.10.17 and 3.10.53 ?
> 
> I'll try it out, but why don't we update the package and the kernel
> versions at once. A quick glance at the git repos shows that there's a
> 3.10.53 version for QMX6, Nitrogen6x and all the Freescale boards.
> Then the Wandboard doesn't appear to be maintained as it's still using
> a 3.0.x kernel and the riotboard uses mainline kernel.

Well, you're only looking at boards that have a defconfig in Buildroot.
But I'm pretty sure there are lots of people using Buildroot on custom
i.MX6 boards, which may not necessarily be supported by all kernel
versions.

That being said, the jump from 3.10.17 to 3.10.53 is probably
relatively easy, so people having such custom i.MX6 boards could just
as well do the jump.

So, I'd indeed suggest to move all i.MX6 defconfigs in Buildroot to
3.10.53, and update the GPU drivers accordingly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
