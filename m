From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Sep 2014 14:39:51 +0200
Subject: [Buildroot] [PATCH] mesa3d: Add missing dependencies
References: <1410883118-57489-1-git-send-email-Vincent.Riera@imgtec.com>
 <87sijr8h2t.fsf@dell.be.48ers.dk>
Message-ID: <XnsA3AE952C5BE84berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote in 
news:87sijr8h2t.fsf at dell.be.48ers.dk:

>  MESA3D_CONF_OPT += \
> -       --without-dri-drivers
> +       --without-dri-drivers --disable-dri

Hi,

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Please note that enabling dri3 support in mesa3d is currently broken when 
used together with xdriver_xf86-video-intel:
https://github.com/OpenELEC/OpenELEC.tv/commit/b574ad91fe9c7b9fcf627df0d5e3c7
7e262a1f85#diff-87b6f34fde55cda38c8e119be89a63d4

Regards, Bernd
