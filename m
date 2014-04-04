From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 4 Apr 2014 12:47:03 +0200
Subject: [Buildroot] [PATCH 1/1] eudev : bump version to 1.5.3
In-Reply-To: <20140403214802.320a9e60@skate>
References: <1396132833-20016-1-git-send-email-sagaert.johan@skynet.be>
 <20140403214802.320a9e60@skate>
Message-ID: <20140404104702.GA6682@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Thu, Apr 03, 2014 at 09:48:02PM +0200, Thomas Petazzoni wrote:
> Eric,
>
> Can you review/test/ack the below patch, since you're the most active
> person on eudev?
>
> Thanks,
>
> Thomas
>
> On Sat, 29 Mar 2014 23:40:33 +0100, Sagaert Johan wrote:
> > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> > ---
> >  package/eudev/eudev.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> > index a2fe528..8e5e83d 100644
> > --- a/package/eudev/eudev.mk
> > +++ b/package/eudev/eudev.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -EUDEV_VERSION = 1.5.2
> > +EUDEV_VERSION = 1.5.3
> >  EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
> >  EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
> >  EUDEV_LICENSE_FILES = COPYING
I tested eudev 1.5.3 on QEMU/x86. No need to refresh the patches made for
1.5.2.

Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Acked-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Best regards,
ELB
