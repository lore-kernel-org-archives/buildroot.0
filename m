From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:54 +0200
Subject: [Buildroot] [PATCH 7/7] package/libsoundtouch: use gitlab macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328191355.778786-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoundtouch/libsoundtouch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 98b5cc75b3..8a0e807d7a 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUNDTOUCH_VERSION = 2.2
-LIBSOUNDTOUCH_SITE = https://gitlab.com/soundtouch/soundtouch/-/archive/$(LIBSOUNDTOUCH_VERSION)
+LIBSOUNDTOUCH_SITE = $(call gitlab,soundtouch,soundtouch,$(LIBSOUNDTOUCH_VERSION))
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
 LIBSOUNDTOUCH_AUTORECONF = YES
-- 
2.30.2
