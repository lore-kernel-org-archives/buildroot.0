From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  2 Oct 2019 13:35:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/turbolua: bump version to 2.1.3
In-Reply-To: <20191002113513.3290960-1-m.niestroj@grinn-global.com>
References: <20191002113513.3290960-1-m.niestroj@grinn-global.com>
Message-ID: <20191002113513.3290960-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/turbolua/turbolua.hash | 2 +-
 package/turbolua/turbolua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index 164bb6139b..03744d83b4 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a2c30534706fb475545b17a017c63479e93e5e9bf1f5ed88c0db22bb4ea7b4b1 turbolua-2.1.2.tar.gz
+sha256 4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3 turbolua-2.1.3.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index 58d66c5070..a85256a3e1 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = 2.1.2
+TURBOLUA_VERSION = 2.1.3
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,v$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
-- 
2.23.0
