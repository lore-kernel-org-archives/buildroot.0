From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Nov 2014 10:36:51 -0300
Subject: [Buildroot] [PATCH 5/7] dash: bump to 0.5.8-2
In-Reply-To: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415281013-1077-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dash/dash.hash | 4 ++--
 package/dash/dash.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 0198cd8..c4e60a4 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,3 +1,3 @@
-# From http://ftp.debian.org/debian/pool/main/d/dash/dash_0.5.8-1.dsc
+# From http://ftp.debian.org/debian/pool/main/d/dash/dash_0.5.8-2.dsc
 sha256	c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f	dash_0.5.8.orig.tar.gz
-sha256	d751769cc1ef8b825a177e782f1cd3e35bde7c268107fa4febf8d235e12c64d9	dash_0.5.8-1.diff.gz
+sha256	00168a934864c26cae9a51367fe7ea013ece2d4844ff8bd6893fc00a8fa7b38c	dash_0.5.8-2.diff.gz
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index ed8525c..13169d1 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -6,8 +6,8 @@
 
 DASH_VERSION = 0.5.8
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
-DASH_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/d/dash
-DASH_PATCH = dash_$(DASH_VERSION)-1.diff.gz
+DASH_SITE = http://snapshot.debian.org/archive/debian/20141022T163236Z/pool/main/d/dash
+DASH_PATCH = dash_$(DASH_VERSION)-2.diff.gz
 DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
-- 
2.0.4
