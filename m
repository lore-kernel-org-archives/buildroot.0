From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Oct 2014 05:37:50 +0100
Subject: [Buildroot] [git commit] package/libcap: bump version to 2.24
Message-ID: <20141026044831.C1071AFE0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57280c2f244500ac6616377b3b8eab458c1ead23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap/libcap.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
 
