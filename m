From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Dec 2017 21:51:00 +0100
Subject: [Buildroot] [git commit] webp: bump to version 0.6.1
Message-ID: <20171219205131.21F60807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f21cbabb2f21e52686c42d41a35bc32f27143866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 3023bc6..ffb63b8 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	c928119229d4f8f35e20113ffb61f281eda267634a8dc2285af4b0ee27cf2b40	libwebp-0.6.0.tar.gz
+sha256	06503c782d9f151baa325591c3579c68ed700ffc62d4f5a32feead0ff017d8ab	libwebp-0.6.1.tar.gz
 sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index e86e798..f5ca342 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.6.0
+WEBP_VERSION = 0.6.1
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
