From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Sep 2014 20:20:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix compile error on
	arm4/arm5
References: <1411496109-508-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA3B1CF0022AECberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1411496109-508-1-git-send-email-bernd.kuhls at t-online.de:

>  package/ffmpeg/ffmpeg-0002-arm4-arm5.patch |   87 
++++++++++++++++++++++++++++

Hi,

this patch also fixes this tvheadend build error:
http://autobuild.buildroot.net/results/910/910fb83484f49923af6efec43955695e30
0bcb61//

Regards, Bernd
