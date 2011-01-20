From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 09:57:56 +0100
Subject: [Buildroot] [git commit master 1/1] libsndfile: bump to version
	1.0.23
Message-ID: <20110120085839.0A2518A5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e3d1242d8c6083aa35c7bf95eb099adfb7d3aab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libsndfile/libsndfile.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/multimedia/libsndfile/libsndfile.mk b/package/multimedia/libsndfile/libsndfile.mk
index acc0d1c..d554699 100644
--- a/package/multimedia/libsndfile/libsndfile.mk
+++ b/package/multimedia/libsndfile/libsndfile.mk
@@ -3,10 +3,9 @@
 # libsndfile
 #
 #############################################################
-LIBSNDFILE_VERSION:=1.0.18
-LIBSNDFILE_SOURCE:=libsndfile-$(LIBSNDFILE_VERSION).tar.gz
-LIBSNDFILE_SITE:=http://www.mega-nerd.com/libsndfile
-LIBSNDFILE_LIBTOOL_PATCH:=NO
-LIBSNDFILE_INSTALL_STAGING:=YES
+
+LIBSNDFILE_VERSION = 1.0.23
+LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
+LIBSNDFILE_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/multimedia,libsndfile))
-- 
1.7.3.4
