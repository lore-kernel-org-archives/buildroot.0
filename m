From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 16 Mar 2014 14:42:42 -0400
Subject: [Buildroot] [PATCH] mtools: update upstream URL
Message-ID: <1394995362-7257-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previously specified tux.org URL did not appear to be maintained.
The gnu.org URL looks better maintained and is the same domain as the
actual tarball download.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/mtools/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtools/Config.in.host b/package/mtools/Config.in.host
index 96f11d1..96b332b 100644
--- a/package/mtools/Config.in.host
+++ b/package/mtools/Config.in.host
@@ -6,4 +6,4 @@ config BR2_PACKAGE_HOST_MTOOLS
 	  names, OS/2 Xdf disks and 2m disks (store up to 1992k on a high
 	  density 3 1/2 disk).
 
-	  http://www.tux.org/pub/tux/mtools/
+	  http://www.gnu.org/software/mtools/
-- 
1.8.3.2
