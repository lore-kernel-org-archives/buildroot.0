From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Aug 2019 12:42:49 +0200
Subject: [Buildroot] [PATCH v6 07/10] package/mesa3d: add a new option
 to enable GLX support
References: <20190804185417.6562-1-bernd.kuhls@t-online.de>
 <20190804185417.6562-7-bernd.kuhls@t-online.de>
 <CAK4VdL2Vw4stKEJA6Tyg4mGT=uBJxt00qitwh=JZcDQo=cFYhg@mail.gmail.com>
 <3or42gxeq6.ln2@ID-313208.user.individual.net>
 <ff8c9c3b-6ddf-462c-51a8-c12270714c20@gmail.com>
Message-ID: <92852gxeq6.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 11 Aug 2019 12:02:37 +0200 schrieb Romain Naour:

> Indeed this patch trigger the issue, I think we need to replace
> BR2_PACKAGE_XORG7 by BR2_PACKAGE_MESA3D_OPENGL_GLX before making mesa3d
> a libgl provider:
> 
> https://git.buildroot.net/buildroot/tree/package/mesa3d/mesa3d.mk#n174

Hi Romain,

done, sent v7 including bump to 19.1.4 and lima driver:
http://patchwork.ozlabs.org/project/buildroot/list/?series=124414

Regards, Bernd
