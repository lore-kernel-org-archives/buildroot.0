From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri,  8 Jul 2016 17:39:06 -0400
Subject: [Buildroot] [PATCH] dtach: bump to version v0.9
Message-ID: <1468013946-1285-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As part of the v0.9 release, development moved from sourceforge to
GitHub.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/dtach/dtach.hash | 2 +-
 package/dtach/dtach.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dtach/dtach.hash b/package/dtach/dtach.hash
index c9b7a4c..c643264 100644
--- a/package/dtach/dtach.hash
+++ b/package/dtach/dtach.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  16614ebddf8ab2811d3dc0e7f329c7de88929ac6a9632d4cb4aef7fe11b8f2a9  dtach-0.8.tar.gz
+sha256  5f7e8c835ee49a9e6dcf89f4e8ccbe724b061c0fc8565b504dd8b3e67ab79f82  dtach-v0.9.tar.gz
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
index 5f5a903..75c4434 100644
--- a/package/dtach/dtach.mk
+++ b/package/dtach/dtach.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DTACH_VERSION = 0.8
-DTACH_SITE = http://downloads.sourceforge.net/project/dtach/dtach/$(DTACH_VERSION)
+DTACH_VERSION = v0.9
+DTACH_SITE = $(call github,crigler,dtach,$(DTACH_VERSION))
 DTACH_LICENSE = GPLv2+
 DTACH_LICENSE_FILES = COPYING
 
-- 
2.7.4
