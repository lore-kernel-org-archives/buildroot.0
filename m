From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Dec 2015 18:01:30 +0100
Subject: [Buildroot] [PATCH 03/12] package/mesa3d: add support for new
 virgl Gallium driver
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
 <1450522892-14611-3-git-send-email-bernd.kuhls@t-online.de>
 <20151219214827.GD3394@free.fr>
Message-ID: <ag3jkcxh6u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 19 Dec 2015 22:48:27 +0100 schrieb Yann E. MORIN:

>     configure: error: --with-egl-platforms=drm is required to build the
>     virgl driver.

Hi Yann,

fixed by http://patchwork.ozlabs.org/patch/559347/

Regards, Bernd
