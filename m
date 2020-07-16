From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Jul 2020 23:33:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnftnl: bump to version 1.1.7
Message-ID: <20200716213343.2074042-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 0114619089..f22b02af09 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  c1eb5a696fc1d4b3b412770586017bc01af93da3ddd25233d34a62979dee1eca  libnftnl-1.1.6.tar.bz2
+sha256  20dbc13f11004aea2c9e479cfb90359cb11fe3446c3140811c18e4ec1648ed8f  libnftnl-1.1.7.tar.bz2
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index f624474196..f4487bdebe 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.6
+LIBNFTNL_VERSION = 1.1.7
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.27.0
