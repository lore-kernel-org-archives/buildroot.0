From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jan 2013 23:30:26 +0100
Subject: [Buildroot] [git commit] wipe: add license information
Message-ID: <20130129223113.81F049A88E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9565d594ea8d259bc23847deece3963d062a56d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wipe/wipe.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index e523a31..eed90be 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -8,6 +8,8 @@ WIPE_VERSION = 2.3.1
 WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
 WIPE_AUTORECONF = YES
+WIPE_LICENSE = GPLv2+
+WIPE_LICENSE_FILES = LICENSE
 
 define WIPE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
