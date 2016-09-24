From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:40 -0300
Subject: [Buildroot] [PATCH 7/9] glibmm: bump to version 2.50.0
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474738122-18949-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index 82775e3..fbcf855 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.48/glibmm-2.48.1.sha256sum
-sha256	dc225f7d2f466479766332483ea78f82dc349d59399d30c00de50e5073157cdf	glibmm-2.48.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.50/glibmm-2.50.0.sha256sum
+sha256	df726e3c6ef42b7621474b03b644a2e40ec4eef94a1c5a932c1e740a78f95e94	glibmm-2.50.0.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 741b45e..0daca58 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.48
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).1
+GLIBMM_VERSION_MAJOR = 2.50
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
-- 
2.7.3
