From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:40 -0000
Subject: [Buildroot] [git commit] webp: bump to 0.6.0
Message-ID: <20171201205314.2D6317F8A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba9e779e83acd31f88d4cf8f2a2b6907a0e4ab2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index bf4ee8f..e9b2060 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	b75310c810b3eda222c77f6d6c26b061240e3d9060095de44b2c1bae291ecdef	libwebp-0.5.2.tar.gz
+sha256	c928119229d4f8f35e20113ffb61f281eda267634a8dc2285af4b0ee27cf2b40	libwebp-0.6.0.tar.gz
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 7cf3df2..8213027 100644
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
