From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Jun 2018 22:56:31 +0200
Subject: [Buildroot] [PATCH 1/1] boinc: bump to version 7.10.2
Message-ID: <20180604205631.1550-1-fontaine.fabrice@gmail.com>
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
index 564096c745..8dc0575dd3 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 5c77752a5cbb69b2dc0343c5aea331f2ec73410d9f33f5f50867e4071e799609  boinc-7.10.1.tar.gz
+sha256 aacce87543354c8aeaf8a2f8d4885ab25f994dbaa8a372adf8a3d5d5854a97df  boinc-7.10.2.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 04aacc2c3d..09407cf8f0 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOINC_VERSION_MAJOR = 7.10
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).1
+BOINC_VERSION_MAJOR = 7
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).10.2
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
-- 
2.14.1
