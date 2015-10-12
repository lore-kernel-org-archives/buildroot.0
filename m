From: Martin Bark <martin@barkynet.com>
Date: Mon, 12 Oct 2015 12:38:09 +0100
Subject: [Buildroot] [v2 3/4] package/zic: Updated ZIC_SITE to use http url
In-Reply-To: <1444649890-28763-1-git-send-email-martin@barkynet.com>
References: <1444649890-28763-1-git-send-email-martin@barkynet.com>
Message-ID: <1444649890-28763-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Change suggested by Vicente Olivert Riera
---
 package/zic/zic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 0bcb800..fcc0288 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -6,7 +6,7 @@
 
 ZIC_VERSION = 2015g
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
-ZIC_SITE = ftp://ftp.iana.org/tz/releases
+ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
 
-- 
2.1.4
