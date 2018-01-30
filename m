From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 23:02:42 +0100
Subject: [Buildroot] [git commit] angularjs: bump version to 1.6.7
Message-ID: <20180130222101.EF3738629D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d69e6f9d3857e9a50e02e5c657a013a947e7875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash for the license file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/angularjs/angularjs.hash | 3 ++-
 package/angularjs/angularjs.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
index 100b6dc667..918c049c73 100644
--- a/package/angularjs/angularjs.hash
+++ b/package/angularjs/angularjs.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 a99e3c22b54178b7646856efd95e825650d32d3125904a28216aeba52e221bad angular-1.4.3.zip
+sha256	4d4e87d24c7d522f4ee765e4f7d454b9cf2a0f6407248545528064e66ad7b085	angular-1.6.7.zip
+sha256	cec36623ceba33c503784164917c206047079159bf88f51a695a4dfb9d9b7ede	angular.js
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 08a4b60845..60702a26d2 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ANGULARJS_VERSION = 1.4.3
+ANGULARJS_VERSION = 1.6.7
 ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
 ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
