From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:25:35 +0200
Subject: [Buildroot] [PATCH 1/1] libjwt: new package.
In-Reply-To: <CAMKz0YoE0s8nNMoxy2-iHLeBKPkNOt7rGBq3gg4B8mxt_QQ5SA@mail.gmail.com>
References: <20180811202925.3547-1-mikael@robomagi.com>
 <20180812143902.5dde6618@windsurf>
 <CAMKz0Yp_0Ccwey=qKoRHFdNf55OL=ZA2GuuCA+SoBaAPNFbzuA@mail.gmail.com>
 <20180812192554.GA29650@scaer>
 <CAMKz0YrmQvWT+uHRhg_mYF6SEOkPn2jKXEySToy60U-s=rd7Cw@mail.gmail.com>
 <20180821195447.GO15347@scaer>
 <CAMKz0YoE0s8nNMoxy2-iHLeBKPkNOt7rGBq3gg4B8mxt_QQ5SA@mail.gmail.com>
Message-ID: <20180821222535.321cb4af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 22:20:32 +0200, Mikael Eliasson wrote:

> > Don;t worry, it is not lost, but:
> >
> >  1. There are currently 197 patches pending:
> >         https://patchwork.ozlabs.org/project/buildroot/list/
> >
> >  2. We are in feature-freeze for the release scheduled by the end of the
> >     month.
> >
> >  3. The Github repository is not the official tree; it is only a mirror.
> >     The official tree is: https://git.buildroot.org/buildroot/  
> 
> OK. Just wanted to know if it was worth putting in the effort on the next
> patch I'm working on.

Yes, it is definitely worth the effort. The latency to get patches
merged can be pretty high, but no patches gets forgotten, thanks to our
patch tracking system.

New packages are rarely controversial (unless they have some
significant complexity or strange things) and are very likely to be
merged. But it does take some time.

Thanks for your contributions!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
