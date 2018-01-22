From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:34:31 +0100
Subject: [Buildroot] [git commit] libtomcrypt: bump to version 1.18.1
Message-ID: <20180122213643.6AD8683E9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c09d002c4a757df499ff149ced55adf4457b559d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtomcrypt/libtomcrypt.hash | 2 +-
 package/libtomcrypt/libtomcrypt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.hash b/package/libtomcrypt/libtomcrypt.hash
index 6f7720e..be8e9b1 100644
--- a/package/libtomcrypt/libtomcrypt.hash
+++ b/package/libtomcrypt/libtomcrypt.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  da9df56a314afaab71963aa71bb6a075ea6bdee3d4db4af045f6bfe23e88b87a  crypt-1.18.0.tar.xz
+sha256  57c13a34fbfd45696189d19e47864e48f4e5c11590c29b444accb8edbf047f14  crypt-1.18.1.tar.xz
diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 020ce79..974ef3f 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMCRYPT_VERSION = 1.18.0
+LIBTOMCRYPT_VERSION = 1.18.1
 LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/v$(LIBTOMCRYPT_VERSION)
 LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.xz
 LIBTOMCRYPT_LICENSE = WTFPL
