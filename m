From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Mar 2016 16:12:36 -0300
Subject: [Buildroot] [PATCH] glibmm: bump to version 2.48.1
Message-ID: <1459451556-26190-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 4b4c173..82775e3 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.48/glibmm-2.48.0.sha256sum
-sha256	b531392b03a34b8d0bd86d8a70510e7812fccfad47bd43eeff9e8a16d8438b85	glibmm-2.48.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.48/glibmm-2.48.1.sha256sum
+sha256	dc225f7d2f466479766332483ea78f82dc349d59399d30c00de50e5073157cdf	glibmm-2.48.1.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 8561a69..741b45e 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM_VERSION_MAJOR = 2.48
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).1
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
-- 
2.7.3
