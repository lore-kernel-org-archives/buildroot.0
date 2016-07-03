From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:13:50 +0200
Subject: [Buildroot] [git commit] libtool: add explicit dependencies for
	host variant
Message-ID: <20160703071558.16BC1819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1ead37082d5688e60b0ec8efb926a01b55e8b57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtool/libtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 8688f8b..1d066bd 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -10,6 +10,7 @@ LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
 LIBTOOL_CONF_ENV = HELP2MAN=true
 LIBTOOL_DEPENDENCIES = host-m4
+HOST_LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPLv2+
 LIBTOOL_LICENSE_FILES = COPYING
 
