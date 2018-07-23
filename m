From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Jul 2018 17:42:34 +0200
Subject: [Buildroot] [PATCH 1/1] boinc: bump to version 7.12.1
Message-ID: <20180723154234.28748-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 8dc0575dd3..289a3abf23 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 aacce87543354c8aeaf8a2f8d4885ab25f994dbaa8a372adf8a3d5d5854a97df  boinc-7.10.2.tar.gz
+sha256 8fcfa84d2c1c90f65b0f1a5b0edf8353341f0211acfaa7538428845d9817e2d7  boinc-7.12.1.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 09407cf8f0..1a34c71867 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOINC_VERSION_MAJOR = 7
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).10.2
+BOINC_VERSION_MAJOR = 7.12
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).1
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
-- 
2.14.1
