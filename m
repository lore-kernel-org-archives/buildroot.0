From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:01:25 +0200
Subject: [Buildroot] [git commit branch/next] package/lzo: bump version to
	2.10
Message-ID: <20170809221936.BF9C47FDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ad2d40c65af7a346d79d38ec2999633795c051f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added locally computed sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lzo/lzo.hash | 4 +++-
 package/lzo/lzo.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lzo/lzo.hash b/package/lzo/lzo.hash
index 415ed99..cf2734f 100644
--- a/package/lzo/lzo.hash
+++ b/package/lzo/lzo.hash
@@ -1,2 +1,4 @@
 # From http://www.oberhumer.com/opensource/lzo/
-sha1 e2a60aca818836181e7e6f8c4f2c323aca6ac057 lzo-2.09.tar.gz
+sha1 4924676a9bae5db58ef129dc1cebce3baa3c4b5d  lzo-2.10.tar.gz
+# Locally computed
+sha256 c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072  lzo-2.10.tar.gz
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 17d8d0f..5b8efdd 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZO_VERSION = 2.09
+LZO_VERSION = 2.10
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
