From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 30 Jun 2015 22:42:18 +0200
Subject: [Buildroot] [PATCH] systemd: fix license according to README file
Message-ID: <1435696938-19587-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/6e3/6e3dace5892a589225a93c896917833ebc8028f3

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ee17bc8..7094b98 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -7,8 +7,8 @@
 SYSTEMD_VERSION = 221
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
-SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
-SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 LICENSE.MIT
+SYSTEMD_LICENSE = LGPLv2.1+; GPLv2 and GPLv2+ for udev; Public Domain license for few source files listed in README
+SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
-- 
2.3.6
