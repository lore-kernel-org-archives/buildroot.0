From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 14:58:39 +0200
Subject: [Buildroot] [git commit] package/cgilua: bump to version 5.2.1
Message-ID: <20190414125420.5865888563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1314033feedd439a367e4962e4dfcc3277de67bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license file changes only due to a style sheet changes:

-    <link rel="stylesheet" href="http://www.keplerproject.org/doc.css" type="text/css"/>
+    <link rel="stylesheet" href="doc.css" type="text/css"/>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cgilua/cgilua.hash | 4 ++--
 package/cgilua/cgilua.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cgilua/cgilua.hash b/package/cgilua/cgilua.hash
index ac977ec38a..8bdb1d18f1 100644
--- a/package/cgilua/cgilua.hash
+++ b/package/cgilua/cgilua.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 8e9ef583f8e1c5b600ebc6bb04924a61f72320130410191a9c56d7295fb02be1  cgilua-5.1.4-2.src.rock
-sha256 e612df003d24aeaf6d3cc09a1e9255493c691866158b5962dc4c68fff8a56a8b  cgilua-5.1.4/doc/us/license.html
+sha256 7d4883e6a89b3463a1d35b8084a6e2afbbb584af7aca1169380e92af0f848413  cgilua-5.2.1-1.src.rock
+sha256 0cf6f0858b0fd90bb5705c8ace77a8afd11e8fce1427fe0a48156937222b8c28  cgilua-5.2.1/doc/us/license.html
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 17b3964259..cd78841fdb 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CGILUA_VERSION = 5.1.4-2
+CGILUA_VERSION = 5.2.1-1
 CGILUA_LICENSE = MIT
 CGILUA_LICENSE_FILES = $(CGILUA_SUBDIR)/doc/us/license.html
 
