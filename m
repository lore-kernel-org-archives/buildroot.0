From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:30:48 +0200
Subject: [Buildroot] [git commit] ccache: bump to version 3.4.3
Message-ID: <20180925213018.AFE0888E98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6d51c8a23ae4d0990eece86810f376727371fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update LICENSE.adoc: change was zlib and year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 5ed5037ed0..e97797fd14 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  18a8b14367d63d3d37fb6c33cba60e1b7fcd7a63d608df97c9771ae0d234fee2  ccache-3.4.2.tar.xz
+sha256  297e55a7622578395c1d5cfa163cc61e345ed69c52aaf94a9583634046c15f4a  ccache-3.4.3.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
-sha256  853e071acb730ca933860a0acf4e44e5dc4bffed6b09503bbcf878e343addcc5  LICENSE.adoc
+sha256  449995742c9358c55b40cefbea5d2c7f05280454d562b6e17a75f46d2c2f6e85  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 851939ebda..3e2283e586 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.4.2
+CCACHE_VERSION = 3.4.3
 CCACHE_SITE = https://www.samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
