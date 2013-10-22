From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 15:51:22 +0200
Subject: [Buildroot] [git commit] systemd: add license information
Message-ID: <20131022140318.1551E9BAF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=418b062f6995576f20abafab769a5a703fc0ac54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
