From: Martin Bark <martin@barkynet.com>
Date: Mon, 12 Oct 2015 11:56:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2015g
In-Reply-To: <1444647391-22164-1-git-send-email-martin@barkynet.com>
References: <1444647391-22164-1-git-send-email-martin@barkynet.com>
Message-ID: <1444647391-22164-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index cf89dc2..c2228e6 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From 2015f release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-August/000033.html
-sha512  d86e6c9e4c6d9cd5de30762723d7a90ac697feeb6dd1f04649f6a35e4e1dc638261c32066db4aeafa767ac339ccd100c38dde044ceadd61e95cb3d39c27f977e  tzdata2015f.tar.gz
+# From 2015g release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
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
-- 
2.1.4
