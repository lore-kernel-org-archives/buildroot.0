From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Date: Mon, 26 Oct 2020 16:05:14 +0100
Subject: [Buildroot] [PATCH] package/angularjs: bump to version 1.8.2
Message-ID: <20201026150514.kqjx4ohyx3mz4mau@zenon.in.qult.net>
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
index efb364913b..5468174e4d 100644
--- a/package/angularjs/angularjs.hash
+++ b/package/angularjs/angularjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a2c1452004943ba1f7caa0d4168a990839cfeccbc27ac66b66adbbd2b50f9a45  angular-1.8.1.zip
-sha256  6ba77ee7e5e8b1ddbfa601bcae30ec7d0daecba6d0993796ad52994bc8631f0d  angular.js
+sha256  471b57064031da8c5fd3b1ba3f52dd1e0d2740a97ed34da2e8ab2a4cc2718280  angular-1.8.2.zip
+sha256  237656fae6e39d02cd71cbcfbf91b7964eba5796aafca1bfcfff3b054ce3fed6  angular.js
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index e69c2abe41..a9bee02162 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ANGULARJS_VERSION = 1.8.1
+ANGULARJS_VERSION = 1.8.2
 ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
 ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
-- 
2.25.1
