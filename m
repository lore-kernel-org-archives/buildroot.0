From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 22 Feb 2018 09:44:57 -0500
Subject: [Buildroot] [PATCH-FOR-NEXT v1 6/6] qt5webengine: set ninja
 host pkg-config tool
In-Reply-To: <20180221225931.5996c857@windsurf.lan>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-7-gael.portay@savoirfairelinux.com>
 <20180221225931.5996c857@windsurf.lan>
Message-ID: <20180222144457.5lh5avjy5mkdjjfz@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Feb 21, 2018 at 10:59:31PM +0100, Thomas Petazzoni wrote:
> ... 
> 
> Same comment for this one as for PATCH 5/6: what happens if we apply
> your series up to PATCH 5/6, but excluding PATCH 6/6 ? qt5webengine
> will fail to build, while it was building before, which is a
> regression. So I assume this should be in the 5.10 bump as well, or
> kept separate during the review, and squashed when applying. But it
> should be mentioned.
> 

Right.

I will squash both patches in the next version of the patchset.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com

Regards,
Gael
