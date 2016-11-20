From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 15:55:54 +0100
Subject: [Buildroot] [git commit] dosfstools: update URL in Config.in.host
Message-ID: <20161120145558.0A3AA802E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63a20d5dfebe83e2b2bd683dc78ebdf787dff100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update URL in Config.in.host to match Config.in.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dosfstools/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dosfstools/Config.in.host b/package/dosfstools/Config.in.host
index 6156c5a..fc488c0 100644
--- a/package/dosfstools/Config.in.host
+++ b/package/dosfstools/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_DOSFSTOOLS
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
-	  http://www.daniel-baumann.ch/software/dosfstools/
+	  https://github.com/dosfstools/dosfstools
