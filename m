From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:59:08 +0100
Subject: [Buildroot] [git commit] package/angularjs: bump version to 1.7.8
Message-ID: <20190318215559.00F7D890D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00dcde3eb12d194d31356fd6e54c0328acd371a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/angularjs/angularjs.hash | 4 ++--
 package/angularjs/angularjs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
index 918c049c73..61a9ceeb7c 100644
--- a/package/angularjs/angularjs.hash
+++ b/package/angularjs/angularjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	4d4e87d24c7d522f4ee765e4f7d454b9cf2a0f6407248545528064e66ad7b085	angular-1.6.7.zip
-sha256	cec36623ceba33c503784164917c206047079159bf88f51a695a4dfb9d9b7ede	angular.js
+sha256	4d1e5755d7722fed1fa223d854f209251bfee042c72ffe5cca63c4c1a7a19d78	angular-1.7.8.zip
+sha256	db7862d0083ae74b5c94005d18274c3528f1be2932b72438e2f606a3d1f23ab5	angular.js
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index a941bc3828..cb5ec7c10a 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ANGULARJS_VERSION = 1.6.7
+ANGULARJS_VERSION = 1.7.8
 ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
 ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
