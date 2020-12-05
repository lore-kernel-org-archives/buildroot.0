From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Dec 2020 07:44:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/quickjs: bump to version 2020-11-08
Message-ID: <20201205064442.606683-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 076e4bddb..5dbd4575f 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0021a3e8cdc6b61e225411d05e2841d2437e1ccf4b4cabb9a5f7685ebfb57717  quickjs-2020-09-06.tar.xz
+sha256  2e9d63dab390a95ed365238f21d8e9069187f7ed195782027f0ab311bb64187b  quickjs-2020-11-08.tar.xz
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 557ffb196..1a2e63278 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2020-09-06
+QUICKJS_VERSION = 2020-11-08
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
-- 
2.27.0
