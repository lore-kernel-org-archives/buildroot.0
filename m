From: Matt Kraai <kraai@ftbfs.org>
Date: Tue, 1 Nov 2016 07:57:19 -0700
Subject: [Buildroot] [PATCH 1/2] qt5webchannel: remove
 QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
In-Reply-To: <20161101153701.04acd1d2@free-electrons.com>
References: <20161101140933.859-1-kraai@ftbfs.org>
 <20161101153701.04acd1d2@free-electrons.com>
Message-ID: <20161101145719.qyvdvq6wgfqx5loj@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Nov 01, 2016 at 03:37:01PM +0100, Thomas Petazzoni wrote:
> On Tue,  1 Nov 2016 07:09:32 -0700, Matt Kraai wrote:
> > Signed-off-by: Matt Kraai <kraai@ftbfs.org>
> > ---
> >  package/qt5/qt5webchannel/qt5webchannel.mk | 6 ------
> >  1 file changed, 6 deletions(-)
> 
> Rather than removing these, we should instead make it consistent with
> what qt5engineio is doing, i.e install those examples. See
> qt5engineio.mk.
> 
> Could you rework your patches accordingly?

I've sent updated patches.  Thank you for the suggestion on a better
approach.

-- 
Matt                                           https://ftbfs.org/~kraai/
