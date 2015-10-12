From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:53:44 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2015g
Message-ID: <20151012155506.C1D78800FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=973d0b8a1c89187801104dfd968c65c9056d24f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.hash |    4 ++--
 package/tzdata/tzdata.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index cf89dc2..1ab8334 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From 2015f release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-August/000033.html
-sha512  d86e6c9e4c6d9cd5de30762723d7a90ac697feeb6dd1f04649f6a35e4e1dc638261c32066db4aeafa767ac339ccd100c38dde044ceadd61e95cb3d39c27f977e  tzdata2015f.tar.gz
+# From: http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
+sha512  ad7de0e3e8753861d260f0fcbcbca327516a4dc826f7659370a7fb979e6154f1a26b23d2609acf6e1790c8c59da0b76c42f4a94bf361409c1460f6a8ffa6f879  tzdata2015g.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 336d145..48a0196 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2015f
+TZDATA_VERSION = 2015g
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_STRIP_COMPONENTS = 0
