From: Martin Bark <martin@barkynet.com>
Date: Mon, 12 Oct 2015 12:38:10 +0100
Subject: [Buildroot] [v2 4/4] package/tzdata: Updated TZDATA_SITE to use
	http url
In-Reply-To: <1444649890-28763-1-git-send-email-martin@barkynet.com>
References: <1444649890-28763-1-git-send-email-martin@barkynet.com>
Message-ID: <1444649890-28763-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Change suggested by Vicente Olivert Riera
---
 package/tzdata/tzdata.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 48a0196..39fc262 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -6,7 +6,7 @@
 
 TZDATA_VERSION = 2015g
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
-TZDATA_SITE = ftp://ftp.iana.org/tz/releases
+TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
-- 
2.1.4
