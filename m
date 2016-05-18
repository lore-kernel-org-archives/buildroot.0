From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 May 2016 16:23:17 -0300
Subject: [Buildroot] [PATCH] gdbm: bump to version 1.12
Message-ID: <1463599397-21520-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdbm/gdbm.hash | 5 +++--
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index e7d3592..9759d87 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,2 +1,3 @@
-# From http://lists.gnu.org/archive/html/info-gnu/2013-12/msg00012.html
-sha1	ce433d0f192c21d41089458ca5c8294efe9806b4	gdbm-1.11.tar.gz
+# From http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00009.html
+md5	9ce96ff4c99e74295ea19040931c8fb9	gdbm-1.12.tar.gz
+sha1	86513e8871bb376bc014e9e5a2d18a8e0a8ea2f5	gdbm-1.12.tar.gz
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index f7a4370..55ece88 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.11
+GDBM_VERSION = 1.12
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPLv3+
 GDBM_LICENSE_FILES = COPYING
-- 
2.7.3
