From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Wed, 19 May 2021 12:29:20 +0000
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
In-Reply-To: <20210519142051.6e84a675@windsurf.orange-hotspot>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-2-thomas.petazzoni@bootlin.com>
 <20210519093323.GL2268078@scaer>
 <20210519120237.52ddc109@windsurf.orange-hotspot>
 <223d3cbf-f1cb-4bdc-aff6-f766e428da33@microchip.com>
 <20210519142051.6e84a675@windsurf.orange-hotspot>
Message-ID: <c41d4467-2901-7b32-96cd-4d7d63753223@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/19/21 3:20 PM, Thomas Petazzoni wrote:
> Hello Eugen,
> 
> On Wed, 19 May 2021 11:36:56 +0000
> <Eugen.Hristev@microchip.com> wrote:
> 
>> Thank you for taking care of this. You could have given me more feedback
>> on my previous patch set so I would have changed it, if you felt like
>> it, but now it's done, we can move forward, which is good.
> 
> Agreed, but sometimes the comments/ideas only come when really you
> apply the patch, and you mess up with the code to figure out the most
> appropriate way. Also, it was a way of avoiding another back-and-forth
> with another iteration. I discussed the patch series yesterday with the
> other BR maintainers, respin a series, and it got applied today.
> Problem solved :-)
> 
> (To the exception of the mistake you spotted in PATCH 3/3, of course!).
> 
>> I will add a LICENSE file in the repo soon.
> 
> That would be awesome. Could you add it to both the 3.x and the 4.x
> branches ? It would be nice to have another release on the 3.x branch
> that includes the LICENSE file.

Yes, I would do it for both branches. We have to agree on the format of 
the LICENSE first.

There will be probably a 3.10.3 at some point. There are many patches 
yet on top of 3.10.2

I am sending now a v4 for the ICP board configs.

Eugen

> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
