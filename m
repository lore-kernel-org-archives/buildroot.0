From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:49:45 +0200
Subject: [Buildroot] [git commit] file: add explicit dependencies for host
	variant
Message-ID: <20160703065001.DF9B180304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a136aba9ccf3b75d29fe2f7babdc46d8389906a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
[Thomas: remove host-file dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/file/file.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 5fb3e9c..201651c 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -7,6 +7,7 @@
 FILE_VERSION = 5.28
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
+HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2c, one file BSD-4c, one file BSD-3c
