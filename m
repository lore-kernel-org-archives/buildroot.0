From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:12:30 +0200
Subject: [Buildroot] [git commit] ramsmp: define license
Message-ID: <20130710202006.CFD119A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff35cddc63be5ac0d8ed6acc98e601c388245ba4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix license file name]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ramsmp/ramsmp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ramsmp/ramsmp.mk b/package/ramsmp/ramsmp.mk
index 1b44402..7d4eee7 100644
--- a/package/ramsmp/ramsmp.mk
+++ b/package/ramsmp/ramsmp.mk
@@ -7,6 +7,8 @@
 RAMSMP_VERSION = 3.5.0
 RAMSMP_SITE = http://www.alasir.com/software/ramspeed
 RAMSMP_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
+RAMSMP_LICENSE = Alasir License
+RAMSMP_LICENSE_FILES = LICENCE
 
 define RAMSMP_BUILD_CMDS
 	cp -f package/ramsmp/Makefile $(@D)
