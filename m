From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Sep 2011 23:44:59 +0200
Subject: [Buildroot] [git commit] gmp: bump to version 5.0.2
Message-ID: <20110913214742.1F31A8D59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1a17d9f60a9eeb03e54f4be9be3a56bd291a138e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gmp/gmp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index cdddca1..c9e3793 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GMP_VERSION = 5.0.1
+GMP_VERSION = 5.0.2
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
-- 
1.7.3.4
