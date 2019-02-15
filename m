From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:45:16 +0100
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: security
 bump to version 2.22.4
Message-ID: <20190215214335.2C9FE7FA18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5546dfd095df4f874ff3bc46e3a2cffda3693340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a maintenance release of the current stable WPE WebKit version,
which contains security fixes for CVE identifiers: CVE-2019-6212,
CVE-2019-6215, CVE-2019-6216, CVE-2019-6217, CVE-2019-6226,
CVE-2019-6227, CVE-2019-6229, CVE-2019-6233, and CVE-2019-6234.
Additionally, it contains a few minor fixes.

Release notes can be found in the announcement:

  https://wpewebkit.org/release/wpe-2.22.4.html

More details on the issues covered by securit fixes can be found
in the corresponding security advisory:

  https://wpewebkit.org/security/WSA-2019-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 39937a3465..27c6cdf33e 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.22.3.tar.xz.sums
-md5 6d0c693ea49a93fc9e701cf784245ea5 wpewebkit-2.22.3.tar.xz
-sha1 d8a22bec787f38939c7922dc43bf27c9144cef74 wpewebkit-2.22.3.tar.xz
-sha256 241f177cded1a4ba3088716650eaaac25588878882170789b3c630ac45dbb2fa wpewebkit-2.22.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.22.4.tar.xz.sums
+md5 6e5c668473c57906bdec1c641bac4579 wpewebkit-2.22.4.tar.xz
+sha1 002b8b25f4fc26bfef68767b3ff1eba1aac53fa5 wpewebkit-2.22.4.tar.xz
+sha256 871e86b7e989de0c1224ac7ab8ed6d8b52756cf793a8c253b56ab8ba8d288c96 wpewebkit-2.22.4.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 6b3d56ab0c..89df9b725c 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.22.3
+WPEWEBKIT_VERSION = 2.22.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
