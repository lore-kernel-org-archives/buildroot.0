From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 10:22:56 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to 2.30.6
Message-ID: <20210328075947.2F5AB80214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26437a51e17be44f670928430c83e4fcb699ce06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which provides fixes for CVE-2020-27918,
CVE-2020-29623, CVE-2021-1765, CVE-2021-1789, CVE-2021-1799,
CVE-2021-1801, and CVE-2021-1870.

Full release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.30.6.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2021-0002.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index df8ac547b0..c3aa8d4164 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.30.5.tar.xz.sums
-md5  63a9a7b7f29862ec827a730ba6542e80  wpewebkit-2.30.5.tar.xz
-sha1  33136493672882d56617007d7ce65268cb79bda7  wpewebkit-2.30.5.tar.xz
-sha256  4b577f4f07c34bb5d453d62b7a41d9e937bd3a2827a92dcd6f47c35f27c8359a  wpewebkit-2.30.5.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.30.6.tar.xz.sums
+md5  e35b31932ad3da6c06736d8f2d347072  wpewebkit-2.30.6.tar.xz
+sha1  25a481e97e463df08fb2c0b0fa5d4299938670ac  wpewebkit-2.30.6.tar.xz
+sha256  893a3098226f116bbb38a665a3053c7d30e3c5dca786b954f9aa38f8c8581468  wpewebkit-2.30.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 78f729f824..b18ee2a37d 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.30.5
+WPEWEBKIT_VERSION = 2.30.6
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
