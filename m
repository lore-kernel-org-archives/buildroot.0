From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Thu, 26 Jun 2014 13:30:29 -0700
Subject: [Buildroot] [PATCH 1/1] opkg: bump to version 0.2.2 and update
	upstream url
Message-ID: <1403814629-4007-1-git-send-email-vsergeev@kumunetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
---
 package/opkg/opkg.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index c57bd7f..56db604e 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-OPKG_VERSION = v0.2.0
-OPKG_SOURCE = $(OPKG_VERSION).tar.bz2
-OPKG_SITE = https://bitbucket.org/opkg/opkg/get
+OPKG_VERSION = v0.2.2
+OPKG_SITE = git://git.yoctoproject.org/opkg
 # Uses PKG_CHECK_MODULES() in configure.ac
 OPKG_DEPENDENCIES = host-pkgconf
 OPKG_LICENSE = GPLv2+
-- 
2.0.0
