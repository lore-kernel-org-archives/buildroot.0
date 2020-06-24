From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 21:22:34 +0200
Subject: [Buildroot] [git commit] package/libcurl: security bump to version
 7.71.0
Message-ID: <20200624192141.3D88A83243@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8370769d4a5e62e7054872053eafdd99419fef36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2020-8177: curl overwrite local file with -J.

CVE-2020-8169: Partial password leak over DNS on HTTP redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 2157f3d2d2..104d603f3e 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
-sha256  032f43f2674008c761af19bf536374128c16241fb234699a55f9fb603fcfbae7  curl-7.70.0.tar.xz
+sha256  cdf18794393d8bead915312708a9e5d819c6e9919de14b20d5c8e7987abd9772  curl-7.71.0.tar.xz
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index cc2ca0aa65..11748924ff 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.70.0
+LIBCURL_VERSION = 7.71.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
