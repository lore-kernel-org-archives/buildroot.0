From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:52 -0300
Subject: [Buildroot] [PATCH 04/13] libsndfile: bump to version 1.0.25
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
