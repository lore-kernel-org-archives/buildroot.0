From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 08:15:54 -0300
Subject: [Buildroot] [PATCH 1/2] glibmm: bump to version 2.48.0
Message-ID: <1459163755-16442-1-git-send-email-gustavo@zacarias.com.ar>
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
index c070363..4b4c173 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.46/glibmm-2.46.3.sha256sum
-sha256	c78654addeb27a1213bedd7cd21904a45bbb98a5ba2f2f0de2b2f1a5682d86cf	glibmm-2.46.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.48/glibmm-2.48.0.sha256sum
+sha256	b531392b03a34b8d0bd86d8a70510e7812fccfad47bd43eeff9e8a16d8438b85	glibmm-2.48.0.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 4b6d68f..8561a69 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.46
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).3
+GLIBMM_VERSION_MAJOR = 2.48
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
-- 
2.7.3
