From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:55:42 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2015f
Message-ID: <20150901083107.20A767F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7eebcd24dc9897feb2233660fafb393521485b6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.hash |    4 ++--
 package/tzdata/tzdata.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 091f57c..cf89dc2 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From 2015e release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-June/000032.html
-sha512  86498190a20c5c67827aa75f7e9c6aa6c19d58a88a70425ce70d5ae7cea42dc7386eb2867fa455fcfcdedc6a105ad70fbbdc7c27c7a58a51bd21d76a135983ce  tzdata2015e.tar.gz
+# From 2015f release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-August/000033.html
+sha512  d86e6c9e4c6d9cd5de30762723d7a90ac697feeb6dd1f04649f6a35e4e1dc638261c32066db4aeafa767ac339ccd100c38dde044ceadd61e95cb3d39c27f977e  tzdata2015f.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index c38d4fe..336d145 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2015e
+TZDATA_VERSION = 2015f
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_STRIP_COMPONENTS = 0
