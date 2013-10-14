From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 14 Oct 2013 14:25:04 +0200
Subject: [Buildroot] [PATCH 2/3] systemd: add license information
Message-ID: <1381753505-13119-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/systemd/systemd.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1bb429c..4e4955e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -7,6 +7,8 @@
 SYSTEMD_VERSION = 44
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
+SYSTEMD_LICENSE = GPLv2+
+SYSTEMD_LICENSE_FILES = LICENSE
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
-- 
1.7.10.4
