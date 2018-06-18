From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 18 Jun 2018 19:04:52 -0400
Subject: [Buildroot] [PATCH] qt5: bump latest version to 5.11.0
In-Reply-To: <20180617234604.0a7d1225@windsurf>
References: <20180613234411.14823-1-gael.portay@savoirfairelinux.com>
 <20180617234604.0a7d1225@windsurf>
Message-ID: <20180618230452.clpzxg5no3gio57w@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 17, 2018 at 11:46:04PM +0200, Thomas Petazzoni wrote:
> (...)
> 
> I've applied. But there was something weird, see below.
> 
> 
> > diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
> > index ce1189d0e1..6bd9a9d51b 100644
> > --- a/package/qt5/qt5charts/qt5charts.hash
> > +++ b/package/qt5/qt5charts/qt5charts.hash
> > @@ -1,8 +1,8 @@
> >  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
> >  sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
> 
> This didn't apply, because there was no such hash in upstream
> Buildroot, since qtcharts only appeared in Qt 5.7.
> 
> Could you make sure your patches apply on top of the latest master ?
> 

Facepalm... I forgot to send this patch[1] with the bump; qt5charts is
available with 5.6 since 5.6.3 under the version 2.1.3.

Even worse... the hash bump of 5.11.0 for this module is now missing :(
Could you consider this patch as well[2]. Thanks and sorry about mess
up.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Ga?l

[1]: https://patchwork.ozlabs.org/patch/931215/
[2]: https://patchwork.ozlabs.org/patch/931214/
