From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 15:33:37 +0200
Subject: [Buildroot] [PATCH 09/30] package/musl-fts: new package
In-Reply-To: <CANQCQpbDfgRAvwf1caXcRJV5k1Mi=NeRyiUaE9RS-hCOQ9UWEg@mail.gmail.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
 <CANQCQpbDfgRAvwf1caXcRJV5k1Mi=NeRyiUaE9RS-hCOQ9UWEg@mail.gmail.com>
Message-ID: <20190923153337.1e4a2ed0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 08:12:17 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> > +MUSL_FTS_VERSION = v1.2.7  
> 
> Does it make sense in this case to move the "v" to the SITE like the
> other version fix-ups?  I checked release monitoring and it doesn't
> look like there is an entry yet for this package (ie. no precedence
> has been set yet)

It makes complete sense to move the "v" to the site of course. My bad,
this patch was sitting in a Buildroot branch for quite a while, and I
didn't rework it after the "v" cleanup in all other Buildroot packages.

I'll wait for other comments before sending a v2 (which would be
another 22 patches sent on the mailing list), unless someone applies my
patch and does the fix.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
