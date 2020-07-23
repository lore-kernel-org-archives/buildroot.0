From: Thomas Ruschival <thomas@ruschival.de>
Date: Thu, 23 Jul 2020 19:02:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: bump version to f2f5a50fbf
Message-ID: <20200723170249.177064-1-thomas@ruschival.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream improved testing and fixed minor issues.
Signed-off-by: Thomas Ruschival <thomas@ruschival.de>
---
 package/pistache/pistache.hash | 2 +-
 package/pistache/pistache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
index 63597b4149..5079387eb7 100644
--- a/package/pistache/pistache.hash
+++ b/package/pistache/pistache.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  bcc7640eb4ae4b178e504f18ebf29dd0a6f8189710cdc0fa4703fa27728145e4  pistache-73f248acd6db4c53e6604577b7e13fd5e756f96f.tar.gz
+sha256  70aeef5f5a4603cb2ceb20a284e3239f5da520e68f39dcb572c9f21473ac0b6d  pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d.tar.gz
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index c182754cee..4d6bd283ea 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PISTACHE_VERSION = 73f248acd6db4c53e6604577b7e13fd5e756f96f
+PISTACHE_VERSION = f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d
 PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
 PISTACHE_LICENSE = Apache-2.0
 PISTACHE_LICENSE_FILES = LICENSE
-- 
2.27.0
