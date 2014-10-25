From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Oct 2014 20:19:53 +0200
Subject: [Buildroot] [PATCH 1/3] package/libcap: bump version to 2.24
Message-ID: <1414261195-5009-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcap/libcap.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 8d055de..43c3e7e 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.22
+LIBCAP_VERSION = 2.24
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
-LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.gz
+LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPLv2 or BSD-3c
 LIBCAP_LICENSE_FILES = License
 
-- 
1.7.10.4
