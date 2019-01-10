From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jan 2019 18:59:53 +0100
Subject: [Buildroot] [PATCH 1/3] gnuchess: fix license
Message-ID: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnuchess is licensed under GPL-3.0+ not GPL-2.0+, also add hash for
license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuchess/gnuchess.hash | 1 +
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 064a845eda..e0a1c4c418 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,2 +1,3 @@
 # sha256 locally computed
 sha256 3c425c0264f253fc5cc2ba969abe667d77703c728770bd4b23c456cbe5e082ef  gnuchess-6.2.4.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 1465ab0a00..0abdab5ba5 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -6,7 +6,7 @@
 
 GNUCHESS_VERSION = 6.2.4
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
-GNUCHESS_LICENSE = GPL-2.0+
+GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
 
 GNUCHESS_DEPENDENCIES = host-flex flex
-- 
2.14.1
