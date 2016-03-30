From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 22:31:42 +0200
Subject: [Buildroot] [PATCH 1/2] gst1-libav: switch to unbundled
References: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
 <56FC33CA.1010502@mind.be>
Message-ID: <XnsA5DBE52B0E461berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote in
news:56FC33CA.1010502 at mind.be: 

> Also, it's a bit unfortunate that if ffmpeg is selected automatically,
> BR2_PACKAGE_FFMPEG_FFMPEG will be enabled by default. Well, the binary
> is pretty  small compared to all the codecs so it doesn't matter much.

Hi,

what about not enabling BR2_PACKAGE_FFMPEG_FFMPEG by default?

Regards, Bernd
