From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 21:59:58 +0200
Subject: [Buildroot] [git commit] luajson: bump to version 1.3.4
Message-ID: <20170902195514.EAB1D8041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e7b990dc7f65d813691273470b68bf18ff8c11f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajson/luajson.hash | 2 +-
 package/luajson/luajson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
index deda5ef..36534fe 100644
--- a/package/luajson/luajson.hash
+++ b/package/luajson/luajson.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4898e5575713b37a1eb9badbd3968e15ec1856115daaed9819acf39113616619  luajson-1.3.3-1.src.rock
+sha256 28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
index 67bc266..81a9f81 100644
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJSON_VERSION = 1.3.3-1
+LUAJSON_VERSION = 1.3.4-1
 LUAJSON_SUBDIR = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
