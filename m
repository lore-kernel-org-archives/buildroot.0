From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Sep 2017 11:12:15 +0300
Subject: [Buildroot] [PATCH] package/tslib: update to 1.13
In-Reply-To: <499c25f9-2865-8282-9ce5-015c5c9d0662@ginzinger.com>
References: <20170914072033.24536-1-martink@posteo.de>
 <499c25f9-2865-8282-9ce5-015c5c9d0662@ginzinger.com>
Message-ID: <20170919081215.w7gvi6mzbevlof3o@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Tue, Sep 19, 2017 at 09:47:55AM +0200, Martin Kepplinger wrote:
> On 2017-09-14 09:20, Martin Kepplinger wrote:
> > see https://github.com/kergoth/tslib/releases
> > 
> > Signed-off-by: Martin Kepplinger <martink@posteo.de>
> > ---
> >  package/tslib/tslib.hash | 4 ++--
> >  package/tslib/tslib.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
> > index f053c6cabd..3ed49008fb 100644
> > --- a/package/tslib/tslib.hash
> > +++ b/package/tslib/tslib.hash
> > @@ -1,2 +1,2 @@
> > -# https://github.com/kergoth/tslib/releases/download/1.12/tslib-1.12.tar.xz.sha256
> > -sha256  237f66c9e53789429b1bcc89a36eb7a37f1deb2877e6e7d928e994e3c48d0b83  tslib-1.12.tar.xz
> > +# https://github.com/kergoth/tslib/releases/download/1.13/tslib-1.13.tar.xz.sha256
> > +sha256  b381279f2d6ad6acb80cfc4852860853b7bcd1a9440821e9fe920c33f4e4f8da  tslib-1.13.tar.xz
> > diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> > index 2b4320dca3..06f887a151 100644
> > --- a/package/tslib/tslib.mk
> > +++ b/package/tslib/tslib.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -TSLIB_VERSION = 1.12
> > +TSLIB_VERSION = 1.13
> >  TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
> >  TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
> >  TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
> 
> any objections?

Silence doesn't mean objection. Patches accumulate in the Buildroot 
patchwork[1] in a faster rate than the patches apply rate recently. This patch 
is far from the oldest. So it might take some time.

[1] http://patchwork.ozlabs.org/project/buildroot/list/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
