From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Jun 2021 19:56:26 +0200
Subject: [Buildroot] [PATCH] package/lualdap: bump to version 1.3.0
Message-ID: <20210607175626.2850849-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualdap/lualdap.hash | 2 +-
 package/lualdap/lualdap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
index 488deb4e1..a65260b13 100644
--- a/package/lualdap/lualdap.hash
+++ b/package/lualdap/lualdap.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 0fcd82a77b20f7cee00050b63b4241d462564421bbd464f6fd0c1bebc62bff32  lualdap-1.2.6-1.src.rock
+sha256 49c253f540187c61850c856b8e70e45dca904b81720a760f6a94e4eb474958ad  lualdap-1.3.0-1.src.rock
 sha256 b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
index acfcbdfc6..5dfba8b7a 100644
--- a/package/lualdap/lualdap.mk
+++ b/package/lualdap/lualdap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALDAP_VERSION = 1.2.6-1
+LUALDAP_VERSION = 1.3.0-1
 LUALDAP_SUBDIR = lualdap
 LUALDAP_LICENSE = MIT
 LUALDAP_LICENSE_FILES = $(LUALDAP_SUBDIR)/docs/license.md
-- 
2.30.2
