From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 May 2014 14:26:31 +0200
Subject: [Buildroot] [PATCH 0/2] package/webkit: Broken on rpi?
Message-ID: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

after fixing a configure problem (see patch 1/2) the build failed at the linking
stage, so the real fix, afaics, is to disable webkit for rpi (patch 2/2).
Patch 1/2 therefore is not really needed at all, but the rpi experts should have
a closer look whether webkit could work on rpi despite the current problem.

Regards, Bernd


Bernd Kuhls (2):
  package/webkit: Fix detection of egl headers provided by rpi-userland
  package/webkit: Broken on raspberry pi

 package/webkit/Config.in |    1 +
 package/webkit/webkit.mk |    6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.10.4
