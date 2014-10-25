From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:25:40 +0200
Subject: [Buildroot] [git commit] package/libcap: move download URL back to
	kernel.org
Message-ID: <20141025095905.57517B13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4460b68d65a4d9d2e5116638df1f53b169299ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap/libcap.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index a3b7d4e..8d055de 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -5,10 +5,8 @@
 ################################################################################
 
 LIBCAP_VERSION = 2.22
-# Until kernel.org is completely back up use debian mirror
-#LIBCAP_SITE = http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
-LIBCAP_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libc/libcap2
-LIBCAP_SOURCE = libcap2_$(LIBCAP_VERSION).orig.tar.gz
+LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
+LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.gz
 LIBCAP_LICENSE = GPLv2 or BSD-3c
 LIBCAP_LICENSE_FILES = License
 
