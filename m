From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:24 -0300
Subject: [Buildroot] [PATCH 18/54] libsysfs: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsysfs/libsysfs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 6bd3c5c..fb0310f 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -8,5 +8,7 @@ LIBSYSFS_VERSION = 2.1.0
 LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
 LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING = YES
+LIBSYSFS_LICENSE = GPLv2 (utilities), LGPLv2.1+ (library)
+LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 
 $(eval $(autotools-package))
-- 
1.8.5.5
