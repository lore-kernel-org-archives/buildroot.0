From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 11 Dec 2014 17:24:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: bump to version 2.5
References: <1418313511-12701-1-git-send-email-jkrause@posteo.de>
 <1418313511-12701-2-git-send-email-jkrause@posteo.de>
Message-ID: <XnsA400B126B8B0CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

=?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause-1KBjaw7Xf1
+zQB+pC5nmwQ@public.gmane.org> wrote in news:1418313511-12701-2-git-send-
email-jkrause at posteo.de:

> -FFMPEG_VERSION = 2.4.4
> +FFMPEG_VERSION = 2.5

Hi,

ffmpeg.hash also needs an update.
Otherwise the patch is ok, Kodi rc3 still works with it after adjusting the 
kodi-specific ffmpeg patch, therefore

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
