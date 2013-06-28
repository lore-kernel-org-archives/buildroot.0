From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:24:13 +0200
Subject: [Buildroot] [git commit] curlftpfs: define license
Message-ID: <20130628195141.4F5FD9B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=054ff5c71ed78f70072ea7a2f2abe757b507b6af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/curlftpfs/curlftpfs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
