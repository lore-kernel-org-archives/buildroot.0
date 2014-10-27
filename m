From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:18:51 +0100
Subject: [Buildroot] [git commit] json-javascript: bump version
Message-ID: <20141027002037.4408FB0DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=defb0ddc1dfea7b81729d35274eb7b3ee51ad7eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-javascript/json-javascript.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
