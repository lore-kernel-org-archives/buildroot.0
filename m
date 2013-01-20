From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:40:19 +0100
Subject: [Buildroot] [git commit] libcap: add license informations
Message-ID: <20130120202430.BCDAD9A30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=348e33dd05097ff79a3926c494d0026638a03b9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcap/libcap.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 94a0cbb..dcd3a18 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -9,6 +9,9 @@ LIBCAP_VERSION = 2.22
 #LIBCAP_SITE = http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libc/libcap2
 LIBCAP_SOURCE = libcap2_$(LIBCAP_VERSION).orig.tar.gz
+LIBCAP_LICENSE = GPLv2 or BSD-3c
+LIBCAP_LICENSE_FILES = License
+
 LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
