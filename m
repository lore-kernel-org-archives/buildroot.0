From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 May 2013 13:23:20 +0200
Subject: [Buildroot] [git commit] pptp-linux: add license information
Message-ID: <20130525112531.F2FEC9A2CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c1917ef5becad640c32fdbc0c795d30c9f13f6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pptp-linux/pptp-linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index ded2a19..ef25c9a 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -8,6 +8,8 @@ PPTP_LINUX_VERSION = 1.7.2
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_MAKE = $(MAKE1)
+PPTP_LINUX_LICENSE = GPLv2+
+PPTP_LINUX_LICENSE_FILES = COPYING
 
 define PPTP_LINUX_BUILD_CMDS
 	$(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
