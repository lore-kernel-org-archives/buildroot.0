From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:22:36 +0100
Subject: [Buildroot] [PATCH 7/8] pkgconf: add license informations
In-Reply-To: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358709757-1929-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkgconf/pkgconf.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 36a5bb8..4b00ad3 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -7,6 +7,8 @@
 PKGCONF_VERSION = 0.8.9
 PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
+PKGCONF_LICENSE = pkgconf license
+PKGCONF_LICENSE_FILES = COPYING
 
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
 
-- 
1.7.9.5
