From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 17 Dec 2019 07:30:17 +0100
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3_488
Message-ID: <20191217063017.18248-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 29dba67b32..8522486297 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2c488a7ccddd624fd557af16e71442c367b131d6178e1b4023bbd532bacdda59	iozone3_487.tar
+sha256	960265163d93f15f7ad352f726d4837c5dd794fff357c743fdb56cbcf4abca04	iozone3_488.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 00573d933d..adc5a66955 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_487
+IOZONE_VERSION = 3_488
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-- 
2.17.1
