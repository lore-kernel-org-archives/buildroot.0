From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:23 +0200
Subject: [Buildroot] [PATCH/next 8/9] package/c-icap-modules: bump version
	to 0.4.5
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap-modules/c-icap-modules.hash | 4 ++--
 package/c-icap-modules/c-icap-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index 5df144987..a9fee87e4 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.4.x/
-md5	5acd9487679ed47fbee00270d436718d	c_icap_modules-0.4.2.tar.gz
-sha1	e5f4203980b732b9de165c1e83c4703734c3e0e2	c_icap_modules-0.4.2.tar.gz
+md5 1a7eaa7a34ff35c2440cf303f7b45f22  c_icap_modules-0.4.5.tar.gz
+sha1 515145e6d29413aff8543937504dc5c419043fd5  c_icap_modules-0.4.5.tar.gz
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index 9daee58cd..d75437898 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.4.2
+C_ICAP_MODULES_VERSION = 0.4.5
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPL-2.0+
-- 
2.11.0
