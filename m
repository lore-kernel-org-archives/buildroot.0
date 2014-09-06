From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Sep 2014 18:05:28 +0200
Subject: [Buildroot] [PATCH 0/2] Introduce libudev -> follow-up patches for
	v5
Message-ID: <1410019530-2060-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

here you will find two patches which are meant to be squashed to your patch set.

Both patches add code to the comment to explain that the packages need libudev,
otherwise both libcec and mesa3d are invisible to users until some sort of udev
support is enabled.

Since mesa3d as a whole depends on libudev the special dependency for EGL can
be removed, the code still compiles.

Regards, Bernd


Bernd Kuhls (2):
  sq: package/libcec: needs libudev, not a udev daemon
  sq: package/mesa3d: depends on libudev, not udev

-- 
1.7.10.4
