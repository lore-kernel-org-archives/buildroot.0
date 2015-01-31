From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 22:46:30 +0100
Subject: [Buildroot] [git commit] package/kodi: bump version to 14.1-Helix
Message-ID: <20150131222039.9BEC68005E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c116e99e2152f69e520595b93fe02681bb74e783
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/kodi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 3e649f7..01c7e80 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VERSION = 14.0-Helix
+KODI_VERSION = 14.1-Helix
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
