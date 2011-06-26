From: =?UTF-8?q?Beno=C3=AEt=20Mauduit?= <benoit.mauduit@gmail.com>
Date: Mon, 27 Jun 2011 00:48:13 +0200
Subject: [Buildroot] [git commit] oprofile: Bump to version 0.9.6
Message-ID: <20110626224854.417CA85AA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=001949a1e0aafc6d5dec384f20ccd9059142f774
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
