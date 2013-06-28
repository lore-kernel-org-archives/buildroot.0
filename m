From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:34:55 +0200
Subject: [Buildroot] [git commit] fbgrab: define license
Message-ID: <20130628195143.3A27D9B291@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a354f8a5959b23caf0ac4dacc900187ffda779c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbgrab/fbgrab.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 7645a6b..62539a8 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -8,6 +8,8 @@ FBGRAB_VERSION = 1.0
 FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
 FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
 FBGRAB_DEPENDENCIES = libpng
+FBGRAB_LICENSE = GPLv2
+FBGRAB_LICENSE_FILES = COPYING
 
 define FBGRAB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
