From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:16 +0100
Subject: [Buildroot] [PATCH 10/51] json-javascript: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-10-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/json-javascript/json-javascript.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
index 453ad34..c15b531 100644
--- a/package/json-javascript/json-javascript.mk
+++ b/package/json-javascript/json-javascript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_JAVASCRIPT_VERSION = 42c18c621a411c3f39a81bb0a387fc50dcd738d9
+JSON_JAVASCRIPT_VERSION = 3d7767b6b1f3da363c625ff54e63bbf20e9e83ac
 JSON_JAVASCRIPT_SITE = $(call github,douglascrockford,JSON-js,$(JSON_JAVASCRIPT_VERSION))
 JSON_JAVASCRIPT_LICENSE = Public Domain
 JSON_JAVASCRIPT_LICENSE_FILES = json2.js
-- 
2.1.1
