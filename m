From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 08:06:12 +0200
Subject: [Buildroot] [git commit] powerpc-utils: Bump version to 1.3.4
Message-ID: <20170913055953.C4F3A81092@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ce28934434b51680ecd87eb987f4d4915fa4040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also moves the source tree to the new official upstream location at
ibm-power-utilities GitHub organisation.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index fe5cc6a..437a586 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2a3f4e7ef219d4de642c7da100d7d6511e93556778c0814b2ebc1170256fc844 powerpc-utils-v1.3.3.tar.gz
+sha256 d36372efebc1f6f9409501f7ab68a812843925334dee6438e7b52a53c21574c5 powerpc-utils-v1.3.4.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index 0aa79dc..da7a3c9 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = v1.3.3
-POWERPC_UTILS_SITE = $(call github,nfont,powerpc-utils,$(POWERPC_UTILS_VERSION))
+POWERPC_UTILS_VERSION = v1.3.4
+POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
