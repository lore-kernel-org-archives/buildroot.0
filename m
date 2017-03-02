From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  2 Mar 2017 21:08:26 +0200
Subject: [Buildroot] [PATCH] ed: bump to version 1.14.2
Message-ID: <4945269f33484cc0e6dfd14aad409c4cddbc7f4a.1488481706.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ed/ed.hash | 6 ++----
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 22c1e671dc14..1aa00c0486d9 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,2 @@
-# From http://lists.gnu.org/archive/html/bug-ed/2017-01/msg00002.html
-sha1	a91f785f7e16dc68e1c9c86d532ebd9698171ba0	ed-1.14.1.tar.lz
-# Locally computed
-sha256	ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a	ed-1.14.1.tar.lz
+# From http://lists.gnu.org/archive/html/bug-ed/2017-02/msg00005.html
+sha256	f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db	ed-1.14.2.tar.lz
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 6b9f65ec5280..33323beda87c 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.14.1
+ED_VERSION = 1.14.2
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_CONF_OPTS = \
-- 
2.11.0
