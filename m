From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sat, 26 Nov 2011 21:48:50 +0100
Subject: [Buildroot] [PATCH] libiqrf: Bump to verion v0.1.1.
Message-ID: <1322340530-4758-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/libiqrf/libiqrf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 81e8421..0e3a018 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBIQRF_VERSION = v0.1.0
+LIBIQRF_VERSION = v0.1.1
 LIBIQRF_SITE = git://github.com/nandra/libiqrf.git
 LIBIQRF_INSTALL_STAGING = YES
 
-- 
1.7.5.4
