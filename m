From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Sep 2011 11:09:27 +0200
Subject: [Buildroot] [git commit] lzo: bump version
Message-ID: <20110910091032.121998D51B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b1cf6c6a49571d27e90af68f65c02d5e01e3796
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzo/lzo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index d4195f6..9bd1a6f 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -3,7 +3,7 @@
 # lzo
 #
 #############################################################
-LZO_VERSION = 2.05
+LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_INSTALL_STAGING = YES
 
-- 
1.7.3.4
