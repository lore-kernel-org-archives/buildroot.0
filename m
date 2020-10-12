From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:59:15 +0200
Subject: [Buildroot] [git commit] package/easy-rsa: bump to version 3.0.8
Message-ID: <20201012084913.673A688FE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=161793983f97bc23a477da0b3ad1052d79dde541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/OpenVPN/easy-rsa/releases/tag/v3.0.8

Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/easy-rsa/easy-rsa.hash | 2 +-
 package/easy-rsa/easy-rsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index efd8025de9..e363e570df 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,5 +1,5 @@
 # Locally computed: (after verifying gpg sig)
-sha512  538b4dc4e4277e842849da41e77a10089cfa4652ba6e46355aff5e96a86eab78b2548ea8f81a6b2e20549cc1f2f4c426572185e998df19770cc4df94ee86e83f  EasyRSA-3.0.7.tgz
+sha512  fd2cde4725cffd60c6af1b6aeaff0dbf15f31f0f322c9df75c22838e2297ba9dc3bba610d956464c8227bd74b3e63840e2a3da41fbc5ee1c79c1e7f5350adc94  EasyRSA-3.0.8.tgz
 
 # Hash for license files
 sha256  7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1  COPYING.md
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 64e6b6f6bb..4ec011e179 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.0.7
+EASY_RSA_VERSION = 3.0.8
 EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
