From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 09:58:02 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/wpewebkit:
 security bump to version 2.26.3
Message-ID: <20200307110058.DEAD98EDEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9911ac0794b28fec080d3123aa5bc0340dc91c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues:

- CVE-2019-8835: Multiple memory corruption issues were addressed with
  improved memory handling

- CVE-2019-8844: Multiple memory corruption issues were addressed with
  improved memory handling

- CVE-2019-8846: A use after free issue was addressed with improved memory
  management

For details, see the advisory:
https://webkitgtk.org/security/WSA-2020-0001.html

Drop now upstreamed patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9412a38fecc15308cfe2551e01cb87d15487d145)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 85a3271874..07a06466d0 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.26.2.tar.xz.sums
-md5 057cc2647231e90c8197873df9a9f54c wpewebkit-2.26.2.tar.xz
-sha1 eca4e35af2c2e70bd36a9bdef3bfbbfbd417210c wpewebkit-2.26.2.tar.xz
-sha256 dd4fce390f1721d8d6d017fa712adb990f7230bde84a1b7d27327bd589053fdd wpewebkit-2.26.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.26.3.tar.xz.sums
+md5 735beb5c1f825d5feda2e355aca6bec0 wpewebkit-2.26.3.tar.xz
+sha1 aeda665b3a137ac748ff1d08ce9e4c751f7caf97 wpewebkit-2.26.3.tar.xz
+sha256 2da9fe9c3a8bdfecc4281d848a4eacdd7be8ac5e0fc397020094d68cf32c10b3 wpewebkit-2.26.3.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index c90e2d1421..00e37c44bc 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.26.2
+WPEWEBKIT_VERSION = 2.26.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
