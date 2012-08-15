From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:44 +0200
Subject: [Buildroot] [git commit] openssl: add license info
Message-ID: <20120815100418.8C65B971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e6ab3600f009cd6d1d7ab79cf39f5dbbefbea13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/openssl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index f9816af..4ae65b1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -6,6 +6,8 @@
 
 OPENSSL_VERSION = 1.0.0j
 OPENSSL_SITE = http://www.openssl.org/source
+OPENSSL_LICENSE = OpenSSL or SSLeay
+OPENSSL_LICENSE_FILES = LICENSE
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
 OPENSSL_TARGET_ARCH = generic32
