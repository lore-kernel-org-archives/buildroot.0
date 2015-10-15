From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Oct 2015 20:28:55 +0200
Subject: [Buildroot] [PATCH] ffmpeg: let the user override the --cpu
	value
References: <1444911775-45783-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <7s75fcx73i.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 15 Oct 2015 13:22:55 +0100 schrieb Vicente Olivert Riera:

> Grab the content of BR2_PACKAGE_FFMPEG_EXTRACONF after guessing the CPU,
> so the user will still have the possibility to override it.

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
