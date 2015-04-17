From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Apr 2015 07:26:45 -0300
Subject: [Buildroot] [PATCH 2/2] bmon: drop stray AUTORECONF from last bump
In-Reply-To: <1429266405-9217-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429266405-9217-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429266405-9217-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bmon/bmon.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index b1dc399..e430bf6 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -9,8 +9,6 @@ BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_LICENSE = BSD-2c, MIT
 BMON_LICENSE_FILES = LICENSE.BSD LICENSE.MIT
-# For 0001-build-uclinux-is-also-linux.patch
-BMON_AUTORECONF = YES
 
 # link dynamically unless explicitly requested otherwise
 ifeq ($(BR2_STATIC_LIBS),)
-- 
2.0.5
