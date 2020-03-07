From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 09:58:02 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/webkitgtk:
 security bump to version 2.26.4
Message-ID: <20200307110058.E025A83B21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad946b267b4fdda9441da19c3aa464361f3968a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues:

- CVE-2020-3862: Impact: A malicious website may be able to cause a denial
  of service.  Description: A denial of service issue was addressed with
  improved memory handling.

- CVE-2020-3864: Impact: A DOM object context may not have had a unique
  security origin.  Description: A logic issue was addressed with improved
  validation.

- CVE-2020-3865: Impact: A top-level DOM object context may have incorrectly
  been considered secure.  Description: A logic issue was addressed with
  improved validation.

- CVE-2020-3867: Impact: Processing maliciously crafted web content may lead
  to universal cross site scripting.  Description: A logic issue was
  addressed with improved state management.

- CVE-2020-3868: Impact: Processing maliciously crafted web content may lead
  to arbitrary code execution.  Description: Multiple memory corruption
  issues were addressed with improved memory handling.

For more details, see the advisory:
https://webkitgtk.org/security/WSA-2020-0002.html

While we are at it, adjust the white space in the .hash function to match
the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 97ce61f633b02b1362cb9b9c93b9137a30065747)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 12 ++++++------
 package/webkitgtk/webkitgtk.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 13d8742b7f..0dfbe93137 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,8 +1,8 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.26.3.tar.xz.sums
-md5 4c27d59a032710dae3cffa5990bb6aea webkitgtk-2.26.3.tar.xz
-sha1 8d5a7b4f330788847f85e1b2cb6191435dcf9f28 webkitgtk-2.26.3.tar.xz
-sha256 add51153943cc11d90a7038d0ea5f6332281e6c0be0640f802a211b035f0e611 webkitgtk-2.26.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.26.4.tar.xz.sums
+md5  60f881729f3b71244b7f6e58790073e0  webkitgtk-2.26.4.tar.xz
+sha1  72f209c08ecc8ad4f0f6b767d4fa1be7a652df33  webkitgtk-2.26.4.tar.xz
+sha256  4386900713dfadf9741177210b32623cab22562a79ffd0d446b66569934b113f  webkitgtk-2.26.4.tar.xz
 
 # Hashes for license files:
-sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
-sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce Source/WebCore/LICENSE-LGPL-2.1
+sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
+sha256  f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  Source/WebCore/LICENSE-LGPL-2.1
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index c8ad3c3382..4b0d7abf35 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.26.3
+WEBKITGTK_VERSION = 2.26.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
