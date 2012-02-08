From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  8 Feb 2012 10:50:24 +0100
Subject: [Buildroot] [PATCH v2 1/2] kmod: bump to 5
Message-ID: <1328694625-17204-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/kmod/kmod.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 0e3bc34..acf5f0a 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,4 +1,4 @@
-KMOD_VERSION = 4
+KMOD_VERSION = 5
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = http://packages.profusion.mobi/kmod/
 KMOD_INSTALL_STAGING = YES
-- 
1.7.5.4
