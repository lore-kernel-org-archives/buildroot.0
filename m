From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 22 Feb 2018 09:42:21 -0500
Subject: [Buildroot] [PATCH-FOR-NEXT v1 5/6] qt5webengine: satisfy new
 requirements for 5.10
In-Reply-To: <20180221225815.0ee22315@windsurf.lan>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-6-gael.portay@savoirfairelinux.com>
 <20180221225815.0ee22315@windsurf.lan>
Message-ID: <20180222144221.jj6zfcxr655fcwkq@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Feb 21, 2018 at 10:58:15PM +0100, Thomas Petazzoni wrote:
> ... 
> 
> So if we merge PATCH 4/6, but not this PATCH 5/6, qt5webengine doesn't
> build in its 5.10 version ? If that's the case, then you have a
> bisectability problem.
> 

Right.

> I'm fine with having it separate during the review, to make PATCH 4/6
> be just a mechanism change of all versions and hashes, and PATCH 5/6 be
> a fixup patch that should be squashed into the 5.10 bump once applied.
> But if that's the case, it should be noted...
> 
> > ---
> 
> ... here.
> 

Indeed, it is a good place for this note.

I should have thought of this :)

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com

Regards,
Gael
