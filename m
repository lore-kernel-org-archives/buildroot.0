From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:46 -0700
Subject: [Buildroot] [PATCH 07/11] ramsmp: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-7-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ramsmp/ramsmp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ramsmp/ramsmp.mk b/package/ramsmp/ramsmp.mk
index 1b44402..5fb0542 100644
--- a/package/ramsmp/ramsmp.mk
+++ b/package/ramsmp/ramsmp.mk
@@ -7,6 +7,8 @@
 RAMSMP_VERSION = 3.5.0
 RAMSMP_SITE = http://www.alasir.com/software/ramspeed
 RAMSMP_ARCH = $(if $(BR2_i386),i386)$(if $(BR2_x86_64),x86_64)
+RAMSMP_LICENSE = Alasir License
+RAMSMP_LICENSE_FILES = LICENSE
 
 define RAMSMP_BUILD_CMDS
 	cp -f package/ramsmp/Makefile $(@D)
-- 
1.7.4.1
