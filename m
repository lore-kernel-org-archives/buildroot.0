From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Thu,  9 Nov 2017 15:44:40 +0100
Subject: [Buildroot] [PATCH 1/1] webp: bump to 0.6.0
Message-ID: <20171109144440.14646-1-m.hoffmann@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
---
Tested with ./utils/test-pkg.
Patch should go into next.
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index bf4ee8fbf9..e9b2060908 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	b75310c810b3eda222c77f6d6c26b061240e3d9060095de44b2c1bae291ecdef	libwebp-0.5.2.tar.gz
+sha256	c928119229d4f8f35e20113ffb61f281eda267634a8dc2285af4b0ee27cf2b40	libwebp-0.6.0.tar.gz
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 7cf3df23ca..821302777e 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.5.2
+WEBP_VERSION = 0.6.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.14.1
