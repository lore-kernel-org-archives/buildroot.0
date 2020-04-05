From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Apr 2020 20:44:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/boinc: bump version to 7.16.6
Message-ID: <20200405184451.2068808-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index aa2aebcc4c..b842b6c017 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 33db60991b253e717c6124cce4750ae7729eaab4e54ec718b9e37f87012d668a  boinc-7.16.5.tar.gz
+sha256 caa567da8d3eb50859efe2eeba1c23c7b27d3b0f15b548136e75302713b25303  boinc-7.16.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 3dc1ea65ad..d32b258ea7 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 7.16
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).6
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
-- 
2.25.0
