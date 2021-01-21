From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:01:49 +0100
Subject: [Buildroot] [git commit] package/angularjs: add
 ANGULARJS_CPE_ID_VENDOR and ANGULARJS_CPE_ID_NAME
Message-ID: <20210121204358.3112388F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faa58c38344601849fec84b75634c69e299aa2a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:angularjs:angular.js is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=angularjs

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/angularjs/angularjs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index a9bee02162..4c414c74fe 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -10,6 +10,8 @@ ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
 # There's no separate license file in the archive, so use angular.js instead.
 ANGULARJS_LICENSE_FILES = angular.js
+ANGULARJS_CPE_ID_VENDOR = angularjs
+ANGULARJS_CPE_ID_NAME = angular.js
 
 define ANGULARJS_EXTRACT_CMDS
 	unzip $(ANGULARJS_DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
