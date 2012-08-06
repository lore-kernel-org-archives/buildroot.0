From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 Aug 2012 07:46:45 +0200
Subject: [Buildroot] [PATCH 7/9] rings: add license info
In-Reply-To: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
References: <1344232007-3085-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1344232007-3085-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/rings/rings.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index c196d85..e2a2bd7 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -7,6 +7,7 @@
 RINGS_VERSION = 1.2.3
 RINGS_SITE = http://github.com/downloads/keplerproject/rings
 RINGS_DEPENDENCIES = lua
+RINGS_LICENSE = MIT
 
 define RINGS_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
-- 
1.7.9.5
