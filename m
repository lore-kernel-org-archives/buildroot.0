From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Jul 2021 20:53:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: DRI drivers need either
 glx, egl or gbm
References: <20210720172911.15840-1-bernd.kuhls@t-online.de>
 <20210720202545.74d835bd__29119.6025953226$1626805573$gmane$org@windsurf>
Message-ID: <klijshxl2i.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Tue, 20 Jul 2021 20:25:45 +0200 schrieb Thomas Petazzoni:

> Thanks for the patch. I'm always a bit confused with all these mesa3d
> possibilities. How does this patch fit with what you did in commit
> 15a2f9b819806d38a7d8172a20f80130b1d60e63, where
> BR2_PACKAGE_MESA3D_OSMESA_CLASSIC was renamed
> BR2_PACKAGE_MESA3D_OSMESA_GALLIUM ?

Hi Thomas,

instead of renaming the option I should have removed that line in the 
first place.

Regards, Bernd
