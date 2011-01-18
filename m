From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:32 -0300
Subject: [Buildroot] [PATCH 02/10] libsndfile: bump to version 1.0.23
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
