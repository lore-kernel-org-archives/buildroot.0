From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Mar 2015 09:50:25 -0300
Subject: [Buildroot] [PATCH] wget: bump to version 1.16.3
Message-ID: <1425905425-15988-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a regression of quiet mode not being quiet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/wget.hash | 2 +-
 package/wget/wget.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index dffed4e..faab805 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  a7dfde1bcb0eb135addf587a649fd0e47c1a876edef359b9197cdffd1fdcd7d5  wget-1.16.2.tar.xz
+sha256  67f7b7b0f5c14db633e3b18f53172786c001e153d545cfc85d82759c5c2ffb37  wget-1.16.3.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 382cdf7..742d81e 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.16.2
+WGET_VERSION = 1.16.3
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.0.5
