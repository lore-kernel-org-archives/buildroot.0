From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat,  9 Feb 2019 16:07:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.22.6
Message-ID: <20190209140740.14461-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a maintenance release of the current stable WebKitGTK+ version,
which contains security fixes for CVE identifiers: CVE-2019-6212,
CVE-2019-6215, CVE-2019-6216, CVE-2019-6217, CVE-2019-6226,
CVE-2019-6227, CVE-2019-6229, CVE-2019-6233, and CVE-2019-6234.
Additionally, it contains a few minor fixes.

Release notes can be found in the announcement:

  https://webkitgtk.org/2019/02/09/webkitgtk2.22.6-released.html

More details on the issues covered by securit fixes can be found
in the corresponding security advisory:

  https://webkitgtk.org/security/WSA-2019-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 4cdefa75b7..ed2511976d 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.22.5.tar.xz.sums
-md5 96a731522b800f38e70f85c22f8de477 webkitgtk-2.22.5.tar.xz
-sha1 809b067a1672a81a4ce31363a0872c668cc72953 webkitgtk-2.22.5.tar.xz
-sha256 99d3863f418a7c3a3e37e5062950dbf2d91fb106ec1633459b0ef6f2d5f6cb13 webkitgtk-2.22.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.22.6.tar.xz.sums
+md5 7c21a30f7f078f0b712caf0c7ee966a4 webkitgtk-2.22.6.tar.xz
+sha1 26a8f8951da03aa4dfc2c25257b6899ea3c2558f webkitgtk-2.22.6.tar.xz
+sha256 df90db9c0db0a2072b945fa3e1d45865922bd686c4659cce6cb5897ce357c85b webkitgtk-2.22.6.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 152f42bd7c..c17bbc8028 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.22.5
+WEBKITGTK_VERSION = 2.22.6
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.20.1
