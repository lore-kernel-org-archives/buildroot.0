From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 13:54:22 +0200
Subject: [Buildroot] [git commit] powerpc-utils: Bump version to 1.3.5
Message-ID: <20180619115711.9412888F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09ce2519e5169254435a94d623bc4bca59286da8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CC: Joel Stanley <joel@jms.id.au>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 437a5865c2..0c495d55e9 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d36372efebc1f6f9409501f7ab68a812843925334dee6438e7b52a53c21574c5 powerpc-utils-v1.3.4.tar.gz
+sha256 77efe3978ac9c251c4728a35b9aebd6076583939a8e26cc7f07ffa86432a8bf0 powerpc-utils-v1.3.5.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index da7a3c9cd6..a3bd8832ff 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = v1.3.4
+POWERPC_UTILS_VERSION = v1.3.5
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
