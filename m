From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:22:34 +0100
Subject: [Buildroot] [PATCH 5/8] libcap: add license informations
In-Reply-To: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358709757-1929-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap/libcap.mk |    3 +++
 1 file changed, 3 insertions(+)

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
 
-- 
1.7.9.5
