From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:34 -0300
Subject: [Buildroot] [PATCH 01/16] libsndfile: add licensing info
Message-ID: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsndfile/libsndfile.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 97a8c17..88db576 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -7,5 +7,7 @@
 LIBSNDFILE_VERSION = 1.0.25
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
+LIBSNDFILE_LICENSE = LGPLv2.1+
+LIBSNDFILE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.3.2
