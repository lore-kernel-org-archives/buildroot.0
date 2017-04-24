From: Steve Kenton <skenton@ou.edu>
Date: Mon, 24 Apr 2017 04:44:20 +0000
Subject: [Buildroot] [PATCH 1/1] Bump version and use github helper
Message-ID: <20170424044421.2872-1-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
 package/tovid/tovid.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
index 079fada..0aa8c6c 100644
--- a/package/tovid/tovid.mk
+++ b/package/tovid/tovid.mk
@@ -3,9 +3,8 @@
 # tovid
 #
 ################################################################################
-
-TOVID_VERSION = 0.35.0
-TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/v$(TOVID_VERSION)
+TOVID_VERSION = 0.35.2
+TOVID_SITE = $(call github,<tovid-suite>,<tovid>,$(TOVID_VERSION))
 TOVID_LICENSE = GPL-2.0+
 TOVID_LICENSE_FILES = COPYING
 TOVID_SETUP_TYPE = distutils
-- 
2.9.0.137.gcf4c2cf
