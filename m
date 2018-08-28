From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:37:03 +0200
Subject: [Buildroot] [PATCH] python-lxml: bump to version 4.2.4
In-Reply-To: <20180828101413.21747-1-yegorslists@googlemail.com>
References: <20180828101413.21747-1-yegorslists@googlemail.com>
Message-ID: <20180828223703.689e192a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 12:14:13 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Fix zlib dependency.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d8e/d8e3a9aae0e84fb1b3b8093986ec3a4ce7ca0663
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

It would have been nice to mention explicitly that this patch was for
the next branch, and perhaps that the build issue being fixed is
related to the Python 3.7.0 bump.

But anyway, I've applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
