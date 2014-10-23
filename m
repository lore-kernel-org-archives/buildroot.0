From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:29 +0200
Subject: [Buildroot] [PATCH 03/11] package/libcap: move download URL back to
	kernel.org
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-4-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/libcap/libcap.mk |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

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
 
-- 
1.7.10.4
