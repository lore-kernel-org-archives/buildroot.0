From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:51:51 +0200
Subject: [Buildroot] [git commit] luajson: bump to version 1.3.3
Message-ID: <20140419215315.D983A9C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1356cf7d4c0c9abb3fc3a63b9b8467c42066c3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajson/luajson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
index 3a4f81d..8269a79 100644
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJSON_VERSION = 1.3.2-1
+LUAJSON_VERSION = 1.3.3-1
 LUAJSON_SUBDIR  = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
