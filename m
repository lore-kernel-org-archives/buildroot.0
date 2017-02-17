From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Feb 2017 12:21:16 -0300
Subject: [Buildroot] [PATCH] poppler: bump to version 0.52.0
Message-ID: <20170217152116.11708-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index af597e0..1c57ef3 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e997c9ad81a8372f2dd03a02b00692b8cc479c220340c8881edaca540f402c1f	poppler-0.51.0.tar.xz
+sha256	528b661738839f9a25f6e580fcd2d5db007e0a1948580c6489f0062798ca1992	poppler-0.52.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index fda8284..5c2d096 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.51.0
+POPPLER_VERSION = 0.52.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-- 
2.10.2
