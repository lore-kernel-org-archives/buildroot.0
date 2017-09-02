From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:46 -0000
Subject: [Buildroot] [git commit] package/lzip: bump version to 1.19
Message-ID: <20170902130616.677EA80424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbfe5846b57334ccf7d6653a70a60b12a94c56a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched to sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lzip/lzip.hash | 6 ++----
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 8855231..e074c76 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,2 @@
-# From http://lists.nongnu.org/archive/html/lzip-bug/2016-06/msg00002.html
-sha1	ef42f3209d02c3b3c217a61c8f127bcb8747b128	lzip-1.18.tar.gz
-# Locally calculated after checking pgp signature
-sha256	47f9882a104ab05532f467a7b8f4ddbb898fa2f1e8d9d468556d6c2d04db14dd	lzip-1.18.tar.gz
+# From http://lists.nongnu.org/archive/html/lzip-bug/2017-05/msg00000.html
+sha256 ffadc4f56be1bc0d3ae155ec4527bd003133bdc703a753b2cc683f610e646ba9 lzip-1.19.tar.gz
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index cb88037..b7ba5dd 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.18
+LZIP_VERSION = 1.19
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
