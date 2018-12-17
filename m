From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 17 Dec 2018 05:37:24 +0100
Subject: [Buildroot] [PATCH 1/4] netsurf: add optional dependency
 freetype
In-Reply-To: <20181216215121.0280310e@windsurf.home>
References: <20181212071455.29215-1-francois.perrad@gadz.org>
 <20181216215121.0280310e@windsurf.home>
Message-ID: <CAB0FRstLjfZjryf361dP+-bCq36Y9EeA8vW7f-7m-oaXaDFarw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 16 d?c. 2018 ? 21:51, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello Fran?ois,
>
> Even though I applied the series, I have a few comments.
>
> On Wed, 12 Dec 2018 08:14:52 +0100, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  .../netsurf/0002-fix-freetype-detection.patch | 28 +++++++++++++++++++
> >  package/netsurf/netsurf.mk                    |  7 +++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 package/netsurf/0002-fix-freetype-detection.patch
> >
> > diff --git a/package/netsurf/0002-fix-freetype-detection.patch
> b/package/netsurf/0002-fix-freetype-detection.patch
> > new file mode 100644
> > index 000000000..27c0440e1
> > --- /dev/null
> > +++ b/package/netsurf/0002-fix-freetype-detection.patch
> > @@ -0,0 +1,28 @@
> > +From 85336f2404b9583267019650ea0112ebf1bb571a Mon Sep 17 00:00:00 2001
> > +From: Francois Perrad <francois.perrad@gadz.org>
> > +Date: Wed, 28 Nov 2018 17:59:44 +0100
> > +Subject: [PATCH 2/2] fix freetype detection
>
> When generating patches, use the -N option of git format-patch to avoid
> the numbering: it provides patches that use [PATCH] instead of [PATCH
> X/Y]. We prefer just [PATCH] because the X/Y often get invalid. Your
> series is a good example: this patch adds a PATCH 2/2 patch, and the
> next patch adds a 3/3 patch, and then another patch adds a 4/4 patch.
>
> Another comment: did you submit all those patches to the upstream
> netsurf project ?
>

I will do.

note: this package still fail on autobuilders, see fix on
https://patchwork.ozlabs.org/patch/1013055/

Fran?ois


>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181217/012e8094/attachment-0001.html>
