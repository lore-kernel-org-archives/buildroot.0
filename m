From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Dec 2015 07:50:55 -0300
Subject: [Buildroot] [PATCH] wget: bump to version 1.17.1
Message-ID: <1449917455-25872-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wget/wget.hash | 2 +-
 package/wget/wget.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index faab805..159cd51 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  67f7b7b0f5c14db633e3b18f53172786c001e153d545cfc85d82759c5c2ffb37  wget-1.16.3.tar.xz
+sha256  fe559b61eb9cc01635ac6206a14e02cb51591838c35fa83c7a4aacae0bdd97c9  wget-1.17.1.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 960b92d..2c6ccf2 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.16.3
+WGET_VERSION = 1.17.1
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.4.10
