From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 6 Dec 2009 19:58:45 +0100
Subject: [Buildroot] [git commit master] Bump iw to version 0.9.18
Message-ID: <20091206190057.14634777F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a90172fa47e797f615916e3693ce5cd52c15014
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #767.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    1 +
 package/iw/iw.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index c0a6485..87543e0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 	#761: Add binutils 2.20 to toolchain options
 	#763: [SECURITY] Update pcre to 7.9
 	#765: Add buildroot branding to gcc
+	#767: Bump iw package to 0.9.18
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 9028ba1..3491fec 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 0.9.17
+IW_VERSION = 0.9.18
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = libnl
-- 
1.6.3.3
