From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jul 2020 19:54:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/easy-rsa: bump to version 3.0.7
Message-ID: <20200725175458.825911-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/OpenVPN/easy-rsa/releases/tag/v3.0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/easy-rsa/easy-rsa.hash | 6 +++---
 package/easy-rsa/easy-rsa.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index 5f5a490cbc..efd8025de9 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,6 +1,6 @@
 # Locally computed: (after verifying gpg sig)
-sha512 1e0eb08fb343345c2bc079d622474f1b34dda3a0517b119efc7cb09113ab467f1346a6678e67d65e535bd404c2abb350d47a00c8f24e4541d54dbeb5600fab72 EasyRSA-unix-v3.0.6.tgz
+sha512  538b4dc4e4277e842849da41e77a10089cfa4652ba6e46355aff5e96a86eab78b2548ea8f81a6b2e20549cc1f2f4c426572185e998df19770cc4df94ee86e83f  EasyRSA-3.0.7.tgz
 
 # Hash for license files
-sha256 7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1 COPYING.md
-sha256 640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7 gpl-2.0.txt
+sha256  7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1  COPYING.md
+sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  gpl-2.0.txt
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index b3c57439a7..64e6b6f6bb 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.0.6
-EASY_RSA_SOURCE = EasyRSA-unix-v$(EASY_RSA_VERSION).tgz
+EASY_RSA_VERSION = 3.0.7
+EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
 EASY_RSA_LICENSE_FILES = COPYING.md gpl-2.0.txt
-- 
2.27.0
