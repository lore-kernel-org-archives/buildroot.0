From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:53:27 +0100
Subject: [Buildroot] [git commit] ed: bump to version 1.14.2
Message-ID: <20170303225406.8C78E82288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6ae34e2db6238007154ea89ef44f02c056d159b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ed/ed.hash | 6 ++----
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 22c1e67..1aa00c0 100644
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
index 6b9f65e..33323be 100644
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
