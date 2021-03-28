From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:13:53 +0200
Subject: [Buildroot] [PATCH 6/7] package/ipcalc: use gitlab macro
In-Reply-To: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
References: <20210328191355.778786-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210328191355.778786-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipcalc/ipcalc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index c4ce8b9ceb..ff9d643389 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IPCALC_VERSION = 1.0.0
-IPCALC_SITE = https://gitlab.com/ipcalc/ipcalc/-/archive/$(IPCALC_VERSION)
+IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
-- 
2.30.2
