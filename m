From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 13:28:48 +0200
Subject: [Buildroot] [PATCH v2 6/6] support/testing/tests/core: SSP &
 hardening flags
In-Reply-To: <CANQCQpb1cH1k7NBDuRxfs=cKD4=0AgoS100yR7zxwSapnZyRzw@mail.gmail.com>
References: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
 <20180717100611.1d443355@windsurf>
 <CANQCQpb1cH1k7NBDuRxfs=cKD4=0AgoS100yR7zxwSapnZyRzw@mail.gmail.com>
Message-ID: <20180717132848.0a9d7e0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jul 2018 06:25:28 -0500, Matthew Weber wrote:

> > I'm a bit confused by this patch coming alone, outside of any series.
> > Is it just because you had only changes to this PATCH 6/6 that you
> > didn't resent the full series ?  
> 
> Understood, yeah I should have asked on IRC today before sending.  I
> already had reviewed by on the other patches so I hesitated resending
> them as there wasn't change. Generally, can I add reviewed by's on
> patches that don't change on a sending of a new version as long as the
> patch didn't change?

It's not only that you "can", it's that you "should" so that just
Reviewed-by are not lost.

Of course, if you make changes to the patches, you cannot keep the
Reviewed-by because it may not hold anymore (except if the changes are
really tiny/trivial).

> > In general, my preference is that a full series gets resent, because it
> > is obvious what your intention is. By just resending one patch, I
> > wonder if you really sent that one patch, or if all patches were sent,
> > but the previous ones were lost/not received for some reason.
> 
> Agree, it does make it confusing.  My intent was just to update this
> one as the rest were in a good state without resending and had review.
> Do you want me to resent the complete set?

No need to do that for this one. But in general, my preference goes to
receiving the full series for each iteration. Yes it creates more
noise/traffic on the mailing list, but it makes perfectly clear what is
intended, which to me is more important.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
