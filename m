From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 Jan 2021 14:36:29 +0100
Subject: [Buildroot] [PATCH 03/15] package/angularjs: add
 ANGULARJS_CPE_ID_VENDOR and ANGULARJS_CPE_ID_NAME
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121133639.7332-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:angularjs:angular.js is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=angularjs

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
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
-- 
2.30.0
