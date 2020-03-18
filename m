From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 18 Mar 2020 22:23:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/boinc: bump version to 7.16.5
Message-ID: <20200318212343.307371-1-bernd.kuhls@t-online.de>
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
index 48d61dc919..aa2aebcc4c 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 622ce3335a01ef30add4813c0cc7b65cffcaa5500a7f58f77748d0dbc80e6b06  boinc-7.16.3.tar.gz
+sha256 33db60991b253e717c6124cce4750ae7729eaab4e54ec718b9e37f87012d668a  boinc-7.16.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 827eaa0c84..b6a9374715 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 7.16
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).3
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
-- 
2.25.0
