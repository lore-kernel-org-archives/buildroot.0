From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 22:31:16 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.30.4
Message-ID: <20201223211604.9B5C888311@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81a9e9064fbd7409b77a30fa5759690af62e5527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which provides a fix for CVE-2020-13543.

Full release notes:

  https://wpewebkit.org/release/wpewebkit-2.30.4.html

A detailed security advisory can be found at:

  https://wpewebkit.org/security/WSA-2020-0009.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 3534abf0e4..42bd27f11d 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.30.3.tar.xz.sums
-md5  75f6ef1819b182043a25b916272ebec6  wpewebkit-2.30.3.tar.xz
-sha1  2ed723f779513205449e0c5b7c080eb19d635aee  wpewebkit-2.30.3.tar.xz
-sha256  f2dfc1a6279810353f601bb9bd0d8ef671b41b38352d679b93d01631c2bf7b4b  wpewebkit-2.30.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.30.4.tar.xz.sums
+md5  d423a01ffb5be44e6ad59b2cfb9d6eb3  wpewebkit-2.30.4.tar.xz
+sha1  2fdca7b888966ad2ed7d998bef52c9024dae063f  wpewebkit-2.30.4.tar.xz
+sha256  1e521d85cf8cf344b9fd08eabad7a1d18a330fb7862a77eaf78d7d7b10d5f6ef  wpewebkit-2.30.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 66f86edf4d..d3afdf0094 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.30.3
+WPEWEBKIT_VERSION = 2.30.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
