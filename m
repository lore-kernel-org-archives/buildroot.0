From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 20:56:43 +0200
Subject: [Buildroot] [git commit] udpcast: Bump version to 20120424.
Message-ID: <20130602212054.69B789A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67f4c10ce36b1a3e50d8ff8c83c72b87bd1ed683
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@linaro.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udpcast/udpcast.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index f900b92..54051b9 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-UDPCAST_VERSION = 20071228
+UDPCAST_VERSION = 20120424
 UDPCAST_SOURCE = udpcast-$(UDPCAST_VERSION).tar.gz
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_CONF_ENV = $(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
