From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 16:33:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: bump to version 0.13
Message-ID: <20210717143307.999642-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/darkhttpd/darkhttpd.hash | 4 ++--
 package/darkhttpd/darkhttpd.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index b6618db89a..c6520ba5b2 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a50417b622b32b5f421b3132cb94ebeff04f02c5fb87fba2e31147d23de50505  darkhttpd-1.12.tar.bz2
-sha256  6e1a2e45d8dd3c8835222e3c82e5cccde8e60f02d55555910e18715ec5dc6d04  darkhttpd.c
+sha256  1d88c395ac79ca9365aa5af71afe4ad136a4ed45099ca398168d4a2014dc0fc2  darkhttpd-1.13.tar.gz
+sha256  3239739831a668d1273c0ef5ae1b2147e0f423288b16ed997d7e695cc7e0a6c9  darkhttpd.c
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index 4b65cffe60..56e5a6ecd6 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DARKHTTPD_VERSION = 1.12
-DARKHTTPD_SITE = https://unix4lyfe.org/darkhttpd
-DARKHTTPD_SOURCE = darkhttpd-$(DARKHTTPD_VERSION).tar.bz2
+DARKHTTPD_VERSION = 1.13
+DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
 DARKHTTPD_LICENSE = MIT
 DARKHTTPD_LICENSE_FILES = darkhttpd.c
 
-- 
2.30.2
