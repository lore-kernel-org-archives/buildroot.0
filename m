From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:28:11 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi: bump to version
	15.1-Isengard
Message-ID: <20150828092842.0BD5A81E94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c155f7619679250e9680d51712fc74c1d51b5c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 6399ff1..d91073f 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VERSION = 15.0-Isengard
+KODI_VERSION = 15.1-Isengard
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
