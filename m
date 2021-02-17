From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:29:13 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/wpewebkit: bump
 version to 2.30.5
Message-ID: <20210217100851.90FAB80073@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7310026e9d84beca1b01aa29773330a117c6df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Bugfix release, fixing a number of issues:

- Fix RunLoop objects leaked in worker threads.
- Fix JavaScriptCore AArch64 LLInt build with JIT disabled.
- Use Internet Explorer quirk for Google Docs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 824473576e00fda52fec843ecc397d39cb82a6d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 42bd27f11d..df8ac547b0 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.30.4.tar.xz.sums
-md5  d423a01ffb5be44e6ad59b2cfb9d6eb3  wpewebkit-2.30.4.tar.xz
-sha1  2fdca7b888966ad2ed7d998bef52c9024dae063f  wpewebkit-2.30.4.tar.xz
-sha256  1e521d85cf8cf344b9fd08eabad7a1d18a330fb7862a77eaf78d7d7b10d5f6ef  wpewebkit-2.30.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.30.5.tar.xz.sums
+md5  63a9a7b7f29862ec827a730ba6542e80  wpewebkit-2.30.5.tar.xz
+sha1  33136493672882d56617007d7ce65268cb79bda7  wpewebkit-2.30.5.tar.xz
+sha256  4b577f4f07c34bb5d453d62b7a41d9e937bd3a2827a92dcd6f47c35f27c8359a  wpewebkit-2.30.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index d3afdf0094..a15bec5679 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.30.4
+WPEWEBKIT_VERSION = 2.30.5
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
