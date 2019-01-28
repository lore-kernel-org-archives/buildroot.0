From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:06:07 +0100
Subject: [Buildroot] [git commit] libkcapi: bump to version 1.1.4
Message-ID: <20190128210844.7444381062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55e04fbb4d19033e243b0d8effc6cc2f59cd9198
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (year has been updated):
https://github.com/smuellerDD/libkcapi/commit/3c56934f44a8f5a1257c342942e6e034fc6f20be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkcapi/libkcapi.hash | 4 ++--
 package/libkcapi/libkcapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index b340ea84b6..a9b42bf6e2 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 19c044310eda0bf5403fae8df2eeffcfef33b67cb5b01def5f440d41ff16b55f	libkcapi-1.1.3.tar.xz
-sha256 b0336f8f07a6abf8b0a59d961f53601d7c4a7c09a8137805b730a34a976039f8	COPYING
+sha256 9197f35aca270f97c544fe94dab379b44a2879a07eb78acd5d02c55924902763	libkcapi-1.1.4.tar.xz
+sha256 c6b8402a68999b0f84560ab43cdf60f9ff33c4a9a8ced6a40db9d3b787ba5b4a	COPYING
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING.gplv2
 sha256 13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239	COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 9edf0394d4..48d34ffc40 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 1.1.3
+LIBKCAPI_VERSION = 1.1.4
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES
