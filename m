From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Date: Tue, 20 Oct 2020 17:47:19 +0200
Subject: [Buildroot] [PATCH] package/angularjs: bump version to 1.8.1
Message-ID: <20201020154719.j22q4pgh5x6loizq@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/angularjs/angularjs.hash | 4 ++--
 package/angularjs/angularjs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
index 7df9ae8596..efb364913b 100644
--- a/package/angularjs/angularjs.hash
+++ b/package/angularjs/angularjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c4098f594dc24cc4c8ad469c6d5785a65c0df812afe9f56ea0e4d3490c2fd46d  angular-1.8.0.zip
-sha256  c7df41bc00628bec220b0378dc1f2f5041980758403b6f24b9774ac43a9186d8  angular.js
+sha256  a2c1452004943ba1f7caa0d4168a990839cfeccbc27ac66b66adbbd2b50f9a45  angular-1.8.1.zip
+sha256  6ba77ee7e5e8b1ddbfa601bcae30ec7d0daecba6d0993796ad52994bc8631f0d  angular.js
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 53b837e59f..e69c2abe41 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ANGULARJS_VERSION = 1.8.0
+ANGULARJS_VERSION = 1.8.1
 ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
 ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
-- 
2.25.1
