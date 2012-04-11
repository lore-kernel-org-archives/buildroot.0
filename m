From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Apr 2012 09:27:04 -0300
Subject: [Buildroot] [PATCH] dosfstools: bump to version 3.0.12
Message-ID: <1334147224-6848-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/dosfstools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index e1b6a33..7a8a7e8 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -3,8 +3,8 @@
 # dosfstools
 #
 #############################################################
-DOSFSTOOLS_VERSION = 3.0.11
-DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
+
+DOSFSTOOLS_VERSION = 3.0.12
 DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
 MKDOSFS_BINARY = mkdosfs
 DOSFSCK_BINARY = dosfsck
-- 
1.7.3.4
