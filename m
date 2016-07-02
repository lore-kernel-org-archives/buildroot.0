From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:41 +0200
Subject: [Buildroot] [PATCH 12/69] file: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-13-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/file/file.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 5fb3e9c6e8e4..16c8ca42180b 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -7,6 +7,7 @@
 FILE_VERSION = 5.28
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
+HOST_FILE_DEPENDENCIES = host-file host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2c, one file BSD-4c, one file BSD-3c
-- 
2.1.0
