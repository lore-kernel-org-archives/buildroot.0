From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 14:08:39 +0100
Subject: [Buildroot] [PATCH v7 7/8] docs/manual: add details about
 top-level parallel build support
In-Reply-To: <20181228130327.GW14286@scaer>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-8-thomas.petazzoni@bootlin.com>
 <20181228130327.GW14286@scaer>
Message-ID: <20181228140839.621bda16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the review. I obviously agree on all points, except one,
which I'm discussing below.

On Fri, 28 Dec 2018 14:03:27 +0100, Yann E. MORIN wrote:

> Besides, it would be interesting to list at least a few cases where it
> is known to break, e.g.: qt5 packages...

I'm not sure this is really useful to do, because the list of things
that are known to not work is going to vary a lot over time.

With just the base patch series I posted, a number of things is
breaking, but I will be submitting separately fixes for Meson packages,
for Python packages, and for various random other packages that need
some minor fixups. Hence keeping a list of what works/breaks in the
manual is going to be really annoying to maintain, and I prefer to keep
things simple and say "the feature is experimental, some things may be
broken" until the point where we are confident enough with the feature
to drop the "experimental" mark.

What do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
