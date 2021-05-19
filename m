From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 May 2021 14:20:51 +0200
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
In-Reply-To: <223d3cbf-f1cb-4bdc-aff6-f766e428da33@microchip.com>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-2-thomas.petazzoni@bootlin.com>
 <20210519093323.GL2268078@scaer>
 <20210519120237.52ddc109@windsurf.orange-hotspot>
 <223d3cbf-f1cb-4bdc-aff6-f766e428da33@microchip.com>
Message-ID: <20210519142051.6e84a675@windsurf.orange-hotspot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Wed, 19 May 2021 11:36:56 +0000
<Eugen.Hristev@microchip.com> wrote:

> Thank you for taking care of this. You could have given me more feedback 
> on my previous patch set so I would have changed it, if you felt like 
> it, but now it's done, we can move forward, which is good.

Agreed, but sometimes the comments/ideas only come when really you
apply the patch, and you mess up with the code to figure out the most
appropriate way. Also, it was a way of avoiding another back-and-forth
with another iteration. I discussed the patch series yesterday with the
other BR maintainers, respin a series, and it got applied today.
Problem solved :-)

(To the exception of the mistake you spotted in PATCH 3/3, of course!).

> I will add a LICENSE file in the repo soon.

That would be awesome. Could you add it to both the 3.x and the 4.x
branches ? It would be nice to have another release on the 3.x branch
that includes the LICENSE file.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
