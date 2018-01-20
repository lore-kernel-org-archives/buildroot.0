From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Jan 2018 18:08:53 +0100
Subject: [Buildroot] [PATCH 1/1] boinc: bump to version 7.8.6
Message-ID: <20180120170853.4792-1-fontaine.fabrice@gmail.com>
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
index 3e4c221818..8f44982246 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 e03736026e048a06793bd19d3e613d4053f56fd34fbc8990258705ed3c98cf38  boinc-7.8.5.tar.gz
+sha256 ed5f3dcdc8d1cc5277529afb701377e77d1ff89711368a7456553bf249940bad  boinc-7.8.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index f4cad3ec6b..0105034531 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 7.8
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).6
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
-- 
2.14.1
