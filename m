From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 08:21:51 +0200
Subject: [Buildroot] [PATCH] fscryptctl: bump version for AES-128-CBC /
	AES-128-CTS support
Message-ID: <20170913062151.17055-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Which are supported from linux-4.13 onwards.

While we're at it, add a DEVELOPERS entry.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                         | 1 +
 package/fscryptctl/fscryptctl.hash | 2 +-
 package/fscryptctl/fscryptctl.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b28faab35d..21eafc9d2e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1329,6 +1329,7 @@ N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/orangepi/
 F:	configs/orangepi_pc_defconfig
 F:	package/flickcurl/
+F:	package/fscryptctl/
 F:	package/jo/
 F:	package/libfastjson/
 F:	package/lzop/
diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
index ea3a47b057..b06b96c10f 100644
--- a/package/fscryptctl/fscryptctl.hash
+++ b/package/fscryptctl/fscryptctl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ad5ca31fa2372d4d9c01439bf5b9717d4b9775630d7947b9c6b69377150e76a1  fscryptctl-18428569e4b23cf33b90046aaed3b5fbdab3b191.tar.gz
+sha256 970a8febbcbf315313711d8a7ee3d954dea593d8087744d3cba65f6cb4bebcc1  fscryptctl-f037dcf4354ce8f25d0f371b58dfe7a7ac27576f.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index 843cb7887b..4275bf2b83 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSCRYPTCTL_VERSION = 18428569e4b23cf33b90046aaed3b5fbdab3b191
+FSCRYPTCTL_VERSION = f037dcf4354ce8f25d0f371b58dfe7a7ac27576f
 FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_VERSION))
 FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
-- 
2.11.0
