From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:02 -0300
Subject: [Buildroot] [PATCH 05/19] curlftpfs: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/curlftpfs/curlftpfs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
index 117e041..8ec3e4c 100644
--- a/package/curlftpfs/curlftpfs.mk
+++ b/package/curlftpfs/curlftpfs.mk
@@ -7,6 +7,8 @@
 CURLFTPFS_VERSION = 0.9.2
 CURLFTPFS_SITE = http://downloads.sourceforge.net/project/curlftpfs/curlftpfs/$(CURLFTPFS_VERSION)
 CURLFTPFS_CONF_ENV = ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
+CURLFTPFS_LICENSE = GPLv2
+CURLFTPFS_LICENSE_FILES = COPYING
 CURLFTPFS_DEPENDENCIES = \
 	libglib2 libfuse openssl libcurl \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
-- 
1.8.1.5
