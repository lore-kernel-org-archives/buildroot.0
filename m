From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:32:58 +0100
Subject: [Buildroot] [git commit] openntpd: fix license info/file
Message-ID: <20150116213305.25956800AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0aecdd4d948b2aaf7278689fc290f2ec74592330
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openntpd/openntpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index c23b613..158ac85 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -7,7 +7,7 @@
 OPENNTPD_VERSION = 5.7p1
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
-OPENNTPD_LICENSE_FILES = LICENCE
+OPENNTPD_LICENSE_FILES = COPYING
 
 define OPENNTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/openntpd/S49ntp \
