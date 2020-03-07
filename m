From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 09:54:08 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/webkitgtk:
 security bump to version 2.26.3
Message-ID: <20200307110034.3B5EE82864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e490e72b8e6b3e124ec9476dcb4321aebae8e1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
(cherry picked from commit 35df7bdb07976781d46abc099450ec11349d9680)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 71642ad144..13d8742b7f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.26.2.tar.xz.sums
-md5 65e06fe73ee166447894aaea95038e3b webkitgtk-2.26.2.tar.xz
-sha1 5bd1ccb436c76fd1edb83afd5bec377de5655d45 webkitgtk-2.26.2.tar.xz
-sha256 6b80f0637a80818559ac8fd50db3b394f41cb61904fb9b3ed65fa51635806512 webkitgtk-2.26.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.26.3.tar.xz.sums
+md5 4c27d59a032710dae3cffa5990bb6aea webkitgtk-2.26.3.tar.xz
+sha1 8d5a7b4f330788847f85e1b2cb6191435dcf9f28 webkitgtk-2.26.3.tar.xz
+sha256 add51153943cc11d90a7038d0ea5f6332281e6c0be0640f802a211b035f0e611 webkitgtk-2.26.3.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 1273c1afe8..8f8870c9b0 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.26.2
+WEBKITGTK_VERSION = 2.26.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
