From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libsndfile: bump to version 1.0.25
Message-ID: <20110912052628.4F4B48D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2a49da16465ad2a1993b5a1736c70f6e1b1ac270
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libsndfile/libsndfile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libsndfile/libsndfile.mk b/package/multimedia/libsndfile/libsndfile.mk
index d554699..52ecce5 100644
--- a/package/multimedia/libsndfile/libsndfile.mk
+++ b/package/multimedia/libsndfile/libsndfile.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBSNDFILE_VERSION = 1.0.23
+LIBSNDFILE_VERSION = 1.0.25
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 
-- 
1.7.3.4
