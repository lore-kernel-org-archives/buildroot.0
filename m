From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  6 Nov 2020 18:52:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: add license file
Message-ID: <20201106175249.18635-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file and, while at it, update indentation to two spaces

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/darkhttpd/darkhttpd.hash | 3 ++-
 package/darkhttpd/darkhttpd.mk   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index 39152e3cb9..b6618db89a 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 a50417b622b32b5f421b3132cb94ebeff04f02c5fb87fba2e31147d23de50505 darkhttpd-1.12.tar.bz2
+sha256  a50417b622b32b5f421b3132cb94ebeff04f02c5fb87fba2e31147d23de50505  darkhttpd-1.12.tar.bz2
+sha256  6e1a2e45d8dd3c8835222e3c82e5cccde8e60f02d55555910e18715ec5dc6d04  darkhttpd.c
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index f4831a9426..4b65cffe60 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -8,6 +8,7 @@ DARKHTTPD_VERSION = 1.12
 DARKHTTPD_SITE = https://unix4lyfe.org/darkhttpd
 DARKHTTPD_SOURCE = darkhttpd-$(DARKHTTPD_VERSION).tar.bz2
 DARKHTTPD_LICENSE = MIT
+DARKHTTPD_LICENSE_FILES = darkhttpd.c
 
 define DARKHTTPD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
2.28.0
