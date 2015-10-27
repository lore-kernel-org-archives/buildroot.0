From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 22:50:56 +0100
Subject: [Buildroot] [git commit] libcurl: fix license typo
Message-ID: <20151027215120.7D28880444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83cd80d580651ec6e7bd68ddcc161ba2f4272102
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license for libcurl is actually 'ISC' not 'ICS'.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ab007d6..8587baa 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -11,7 +11,7 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
 	$(if $(BR2_PACKAGE_RTMPDUMP),rtmpdump)
-LIBCURL_LICENSE = ICS
+LIBCURL_LICENSE = ISC
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
 
