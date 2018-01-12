From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 12 Jan 2018 19:20:58 +0100
Subject: [Buildroot] [PATCH 1/1] boinc: bump to version 7.8.5
Message-ID: <20180112182058.16809-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 3f31ee7582..3e4c221818 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 0038044916749687455d0f5ca33e79f14e2d1d5451ddfd04b33446b2d9d467ab  boinc-7.8.4.tar.gz
+sha256 e03736026e048a06793bd19d3e613d4053f56fd34fbc8990258705ed3c98cf38  boinc-7.8.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 04f85ae3a5..f4cad3ec6b 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 7.8
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).4
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
-- 
2.14.1
