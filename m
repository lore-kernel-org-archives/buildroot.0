From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:43:51 +0200
Subject: [Buildroot] [git commit] rapidjson: bump to version 1.0.2
Message-ID: <20150702214355.2D50580E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9186ed6ea9a5ba708943b510abee718ba5ede764
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rapidjson/rapidjson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 6658da2..1ad9314 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = 39f5eeb764c6d1e1cbff1717410d9710bf943009
+RAPIDJSON_VERSION = v1.0.2
 RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
