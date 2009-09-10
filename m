From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Sep 2009 19:51:55 +0200
Subject: [Buildroot] [git commit master] radvd: bump version
Message-ID: <20090910175705.5B43377700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c4bd271661b57c0e5680463e66e1fb18f999c211
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes segfault issues with plug/unplug and other misc fixes.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 07b7224..bf1ac77 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -3,7 +3,7 @@
 # radvd
 #
 #############################################################
-RADVD_VERSION:=1.2
+RADVD_VERSION:=1.5
 RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
 RADVD_SITE:=http://www.litech.org/radvd/dist/
 RADVD_AUTORECONF:=no
-- 
1.6.3.3
