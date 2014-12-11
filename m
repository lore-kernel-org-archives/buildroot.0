From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Thu, 11 Dec 2014 19:59:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: bump to version 2.5
In-Reply-To: <XnsA400B126B8B0CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1418313511-12701-1-git-send-email-jkrause@posteo.de>
 <1418313511-12701-2-git-send-email-jkrause@posteo.de>
 <XnsA400B126B8B0CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <1418324383.1007.1.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2014-12-11 at 17:24 +0100, Bernd Kuhls wrote:
> =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause-1KBjaw7Xf1
> +zQB+pC5nmwQ at public.gmane.org> wrote in news:1418313511-12701-2-git-send-
> email-jkrause at posteo.de:
> 
> > -FFMPEG_VERSION = 2.4.4
> > +FFMPEG_VERSION = 2.5
> 
> Hi,
> 
> ffmpeg.hash also needs an update.
> Otherwise the patch is ok, Kodi rc3 still works with it after adjusting the 
> kodi-specific ffmpeg patch, therefore
> 
> Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
Ah, I missed the warning: No hash found. I will send a new version.
