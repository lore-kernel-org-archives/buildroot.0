From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:42 -0300
Subject: [Buildroot] [PATCH 09/16] libcuefile: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcuefile/libcuefile.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
index ceb1509..d1f2448 100644
--- a/package/libcuefile/libcuefile.mk
+++ b/package/libcuefile/libcuefile.mk
@@ -8,6 +8,8 @@ LIBCUEFILE_VERSION = r475
 LIBCUEFILE_SITE = http://files.musepack.net/source
 LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
 LIBCUEFILE_INSTALL_STAGING = YES
+LIBCUEFILE_LICENSE = GPLv2+
+LIBCUEFILE_LICENSE_FILES = COPYING
 
 define LIBCUEFILE_INSTALL_STAGING_INCLUDES
 	cp -r $(@D)/include $(STAGING_DIR)/usr
-- 
1.8.3.2
