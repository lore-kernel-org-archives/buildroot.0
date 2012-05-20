From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 12:52:49 +0200
Subject: [Buildroot] [git commit] systemd: install into staging
Message-ID: <20120531113259.2820096E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df89af836c1b8c0975917e16e6b3bfcf2fa9a29f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd provides a number of libraries, so install into staging.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/systemd/systemd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 717bdcc..696a3a7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -6,6 +6,7 @@
 SYSTEMD_VERSION = 44
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
+SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
 	libcap \
