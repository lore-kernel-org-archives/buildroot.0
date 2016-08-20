From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Aug 2016 23:14:08 -0300
Subject: [Buildroot] [PATCH] cantarell: bump to version 0.0.25
Message-ID: <1471659248-12346-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cantarell/cantarell.hash | 4 ++--
 package/cantarell/cantarell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index e2cc00e..330e786 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.24.sha256sum
-sha256	9cad649ae84f7e4ca1be637c27e2fa19e1fbf00d4bf6480171ccfad405b39264	cantarell-fonts-0.0.24.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.25.sha256sum
+sha256	14a228aa0b516dfc367b434a850f955a00c57fc549cbb05348e2b150196a737f	cantarell-fonts-0.0.25.tar.xz
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index b4133ec..3cdf600 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CANTARELL_VERSION_MAJOR = 0.0
-CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).24
+CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).25
 CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
-- 
2.7.3
