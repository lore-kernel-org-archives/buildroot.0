From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:32:04 +0200
Subject: [Buildroot] Network problem with buildroot 2012.05
In-Reply-To: <20120719152458.1945a8f6@hp>
References: <20120719152458.1945a8f6@hp>
Message-ID: <20120719233204.6f131f5e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 19 Jul 2012 15:24:58 +0200,
Bj?rn Kirchner <bjoern@am-soft.de> a ?crit :

> I am quite lost here. Does anybody have an idea what can
> cause this behaviour or what to test to narrow the cause
> down?

Most likely this is completely unrelated to Buildroot or PTXdist, but
related to your Linux kernel. Maybe the network support is somehow
buggy for your platforms with certain kernel versions or
configurations. If you use a recent mainline kernel version, please
report your problem to the S3C kernel maintainers, i.e:

ARM/SAMSUNG ARM ARCHITECTURES
M:      Ben Dooks <ben-linux@fluff.org>
M:      Kukjin Kim <kgene.kim@samsung.com>
L:      linux-arm-kernel at lists.infradead.org (moderated for non-subscribers)
L:      linux-samsung-soc at vger.kernel.org (moderated for non-subscribers)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
