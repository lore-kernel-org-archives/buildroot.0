From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Mar 2014 23:10:29 +0100
Subject: [Buildroot] [git commit] mtools: update upstream URL
Message-ID: <20140317221235.1030B9BF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc3a7cc7a189f6221eeee3f11b54ee297f971f4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previously specified tux.org URL did not appear to be maintained.
The gnu.org URL looks better maintained and is the same domain as the
actual tarball download.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtools/Config.in.host b/package/mtools/Config.in.host
index 96f11d1..96b332b 100644
--- a/package/mtools/Config.in.host
+++ b/package/mtools/Config.in.host
@@ -6,4 +6,4 @@ config BR2_PACKAGE_HOST_MTOOLS
 	  names, OS/2 Xdf disks and 2m disks (store up to 1992k on a high
 	  density 3 1/2 disk).
 
-	  http://www.tux.org/pub/tux/mtools/
+	  http://www.gnu.org/software/mtools/
