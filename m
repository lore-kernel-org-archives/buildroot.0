From: =?UTF-8?q?Beno=C3=AEt=20Mauduit?= <benoit.mauduit@gmail.com>
Date: Sun, 15 May 2011 10:50:49 +0200
Subject: [Buildroot] [PATCH] oprofile: Bump to version 0.9.6
Message-ID: <1305449449-5651-1-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/oprofile/oprofile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 42bf0e2..4522cda 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -3,7 +3,7 @@
 # oprofile
 #
 #############################################################
-OPROFILE_VERSION := 0.9.4
+OPROFILE_VERSION := 0.9.6
 OPROFILE_CONF_OPT :=	--localstatedir=/var \
 			--with-kernel-support
 
-- 
1.7.5.1
