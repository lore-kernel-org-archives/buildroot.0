From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:58 +0200
Subject: [Buildroot] [PATCH 29/69] lzop: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-30-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/lzop/lzop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 1b6a7e177c19..43c162840139 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -9,6 +9,7 @@ LZOP_SITE = http://www.lzop.org/download
 LZOP_LICENSE = GPLv2+
 LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
+HOST_LZOP_DEPENDENCIES = host-lzo
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
