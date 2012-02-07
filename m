From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  7 Feb 2012 17:16:20 +0100
Subject: [Buildroot] [PATCH 2/2] kmod: bump to 5
In-Reply-To: <1328631380-12272-1-git-send-email-yegorslists@googlemail.com>
References: <1328631380-12272-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1328631380-12272-2-git-send-email-yegorslists@googlemail.com>
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
