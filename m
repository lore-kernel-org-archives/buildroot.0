From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Oct 2014 21:43:17 +0100
Subject: [Buildroot] [PATCH 38/51] xbmc-pvr-addons: Bump version
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-38-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <XnsA3D2DCF60C386berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Maxime Hadjinlian <maxime.hadjinlian@gmail.com> 
wrote in news:1414349157-22749-38-git-send-email-maxime.hadjinlian at gmail.com:

>  # This cset is on the branch 'gotham'
>  # When XBMC is updated, then this should be updated to the corresponding 
branch
> -XBMC_PVR_ADDONS_VERSION = be12a8da2072e9c3ddad54892df2f85b759d4e9a
> +XBMC_PVR_ADDONS_VERSION = 067befe6b8da81e29abca8cd394d08c84233677b

Hi,

you are sure that code from the master branch of xbmc-pvr-addons is 
compatible with xbmc Gotham? 

Openelec also uses code from the Gotham branch of xbmc-pvr-addons:
https://github.com/OpenELEC/OpenELEC.tv/blob/openelec-
4.2/packages/mediacenter/xbmc-pvr-addons/package.mk

While staying on the Gotham branch you can bump xbmc-pvr-addons to
f7d9b42b2f1795a467093acb9c120b9c361ffbc4 btw.

Regards, Bernd
