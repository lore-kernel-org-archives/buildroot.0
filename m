From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon,  3 Apr 2017 00:13:07 +0530
Subject: [Buildroot] [PATCH 6/7] libplatform: use SPDX short identifier for
	PHP license
In-Reply-To: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491158588-6698-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491158588-6698-6-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/libplatform/libplatform.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index b253028..d013799 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -6,7 +6,7 @@
 
 LIBPLATFORM_VERSION = feafe68e3e0b02c3261aefb3d711863ef6fadd38
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPL-2.0+, PHP license v3.01
+LIBPLATFORM_LICENSE = GPL-2.0+, PHP-3.01
 LIBPLATFORM_LICENSE_FILES = src/os.h src/util/fstrcmp.c
 LIBPLATFORM_INSTALL_STAGING = YES
 
-- 
2.7.4
