From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:41:45 +0100
Subject: [Buildroot] [git commit] kmscube: update the project URL
Message-ID: <20170314224149.DE38B82586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff6747473293035aa9e52ec5fbfdb41f806f2d9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kmscube repository has been moved to freedesktop.org, so
update the URL accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmscube/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index 9ab58f9..b9fe627 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_KMSCUBE
 	help
 	  kmscube is an application to test kms/drm drivers.
 
-	  https://github.com/robclark/kmscube/
+	  https://cgit.freedesktop.org/mesa/kmscube/
