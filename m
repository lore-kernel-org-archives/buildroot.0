From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 10 Nov 2015 18:23:48 +0100
Subject: [Buildroot] [PATCH] configs: new configuration for at91sam9g20ek
In-Reply-To: <20151109222309.67599ac2@free-electrons.com>
References: <1447032023-6229-1-git-send-email-jenskamenik@googlemail.com>
 <20151109115525.GA4302@piout.net>
 <20151109222309.67599ac2@free-electrons.com>
Message-ID: <20151110172348.GB4519@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 09/11/2015 at 22:23:09 +0100, Thomas Petazzoni wrote :
> Alex,
> 
> On Mon, 9 Nov 2015 12:55:25 +0100, Alexandre Belloni wrote:
> 
> > regarding the sort order, I'd say that at91sam9g20ek is not between
> > at91sam9g15ek and at91sam9g25ek (both part of the at91sam9x5 familiy). I
> > would place it before at91sam9g45m10ek. That comment is also valid for
> > the family_, mach_ and dtb_ definitions
> 
> I think you should explain why. It's because you're not interested in
> alphabetic ordering here, but rather "release date" ordering of the
> platform. Is that correct ?
> 

I'd say that I'm more interested in grouping by families and that indeed
would be almost the same as the release date order.
The sam9g20 is almost the same as a sam9260 but is quite far from the
sam9x5 family.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
