From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:32:51 +0100
Subject: [Buildroot] [git commit] package/angularjs: bump version to 1.7.9
Message-ID: <20200106222307.816FD82AF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=510bd02e1f1db4b78d9a76aaf3c68c2fab07332f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/angularjs/angularjs.hash | 4 ++--
 package/angularjs/angularjs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
index 81ef5c160f..4f0f36b2a1 100644
--- a/package/angularjs/angularjs.hash
+++ b/package/angularjs/angularjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	4d1e5755d7722fed1fa223d854f209251bfee042c72ffe5cca63c4c1a7a19d78	angular-1.7.8.zip
-sha256	e3b0100b35fa76ace389c29ee0f69b68126d2e759f7e5df82d4f56254ba53688	angular.js
+sha256	7182e7f39b921469157971d9e0783745758df4b625322d606ec7d9abf2b28af2	angular-1.7.9.zip
+sha256	2420c59374dcdc1ca9721c334a32afee92f0610280cae0d1b3952b1279bc2b24	angular.js
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index cb5ec7c10a..295be5400a 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ANGULARJS_VERSION = 1.7.8
+ANGULARJS_VERSION = 1.7.9
 ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
 ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
