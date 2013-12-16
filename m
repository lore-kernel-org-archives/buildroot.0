From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 Dec 2013 16:14:44 +0000
Subject: [Buildroot] [PATCH] knock: bump git snapshot
Message-ID: <1387210484-52591-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/knock/knock.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 5ed6cf0..e4a3d3c 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 7666f2e86e18d482eaad5fe1fea46d87d80b0555
+KNOCK_VERSION = 7ce33cd553800f48f16b3bb70b9cd0f1310d2c18
 KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
-- 
1.7.1
