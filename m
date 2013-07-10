From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:16:18 +0200
Subject: [Buildroot] [git commit] inadyn: define license
Message-ID: <20130710202007.ED8319A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ea220d53a491220c0ac299f2f15c7c64028617a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/inadyn/inadyn.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 221a3d1..12f8acc 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -7,6 +7,8 @@
 INADYN_VERSION = 1.98.1
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.bz2
 INADYN_SITE = https://github.com/downloads/troglobit/inadyn
+INADYN_LICENSE = GPLv2+
+INADYN_LICENSE_FILES = COPYING LICENSE
 
 define INADYN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
