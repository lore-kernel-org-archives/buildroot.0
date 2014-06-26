From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 16:59:24 +0200
Subject: [Buildroot] [git commit] socketcand: add license information
Message-ID: <20140626151144.35AE79D0D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ced3157cf75bf6b49454dd69fca05e6ff3a96ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use socketcand.c as license file]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socketcand/socketcand.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index fdba96e..0d5b65b 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -7,6 +7,8 @@
 SOCKETCAND_VERSION = 274e4e44107f6138a29bbc4e20f9fbd2a7d4dab1
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
+SOCKETCAND_LICENSE = BSD-3c or GPLv2
+SOCKETCAND_LICENSE_FILES = socketcand.c
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES = libconfig
