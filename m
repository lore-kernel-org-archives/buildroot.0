From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 10:14:45 +0100
Subject: [Buildroot] [RFC v2] linux: add fbtft kernel extension
In-Reply-To: <20141231092041.2b7cfa41@free-electrons.com>
References: <1419969494-9615-1-git-send-email-ps.report@gmx.net>
 <20141230223603.GC3928@free.fr> <20141230232807.GD3928@free.fr>
 <20141231092041.2b7cfa41@free-electrons.com>
Message-ID: <20141231101445.40e73507@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Dec 2014 09:20:41 +0100, Thomas Petazzoni wrote:

> No the proper solution would be for those fbtft people to submit their
> drivers to the upstream kernel. But of course, since those drivers are
> developed by RasberryPi folks, they cannot play with the normal
> open-source rules of contributing things upstream: they *have* to do
> some utter crap and do everything in their own fork.

So, I've just submitted a proposal to include those drivers to the
staging tree of the Linux kernel:

  http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2014-December/063195.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
