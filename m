From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:13:52 +0200
Subject: [Buildroot] [git commit] ramspeed: define license
Message-ID: <20130710202007.27A609A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c82ea0bca8cc527057c8d6687013d9c2a454857
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix license file name]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ramspeed/ramspeed.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
index f87f8bc..7dc4faa 100644
--- a/package/ramspeed/ramspeed.mk
+++ b/package/ramspeed/ramspeed.mk
@@ -7,6 +7,8 @@
 RAMSPEED_VERSION = 2.6.0
 RAMSPEED_SITE = http://www.alasir.com/software/ramspeed
 RAMSPEED_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
+RAMSPEED_LICENSE = Alasir License
+RAMSPEED_LICENSE_FILES = LICENCE
 
 define RAMSPEED_BUILD_CMDS
 	cp -f package/ramspeed/Makefile $(@D)
