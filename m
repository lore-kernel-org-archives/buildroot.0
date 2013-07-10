From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:47 -0700
Subject: [Buildroot] [PATCH 08/11] ramspeed: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-8-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ramspeed/ramspeed.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
index f87f8bc..373dd55 100644
--- a/package/ramspeed/ramspeed.mk
+++ b/package/ramspeed/ramspeed.mk
@@ -7,6 +7,8 @@
 RAMSPEED_VERSION = 2.6.0
 RAMSPEED_SITE = http://www.alasir.com/software/ramspeed
 RAMSPEED_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
+RAMSPEED_LICENSE = Alasir License
+RAMSPEED_LICENSE_FILES = LICENSE
 
 define RAMSPEED_BUILD_CMDS
 	cp -f package/ramspeed/Makefile $(@D)
-- 
1.7.4.1
