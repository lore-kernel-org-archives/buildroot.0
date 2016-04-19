From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Apr 2016 22:08:24 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/freeswitch: select OpenCV
	modules needed for mod_cv
References: <1461085245-30787-1-git-send-email-bernd.kuhls@t-online.de>
 <20160419210522.1df89766@free-electrons.com>
Message-ID: <XnsA5EFE138D3F14ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Thomas,

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160419210522.1df89766 at free-electrons.com: 

> Now that inter-module dependencies are properly handled in opencv.mk,
> why do we have to do all of this?

Hi Thomas,

because I interpreted Samuels mail[1] in a way that he wants to see all
opencv modules mentioned in freeswitch's Config.in.

My patch enables all opencv modules included in
freeswitch/src/mod/applications/mod_cv/mod_cv.cpp, regardless of the code
in opencv/Config.in.

If you prefer a minimal solution you can commit v3:
http://patchwork.ozlabs.org/patch/611882/

Regards, Bernd

[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159041.html
