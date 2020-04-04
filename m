From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Apr 2020 16:21:03 +0200
Subject: [Buildroot] [git commit] package/kmscube: Use the official gitlab
 URL
Message-ID: <20200404140741.F2BFC8A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ab9acbed8a46e1ba60b3ad18a2d9ec8d8b852b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cgit URL is a mirror of the gitlab repository.

The README.md file of the kmscube project also points
to the gitlab repository, so switch the URL accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmscube/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index b9fe627c87..b6ad305bfb 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_KMSCUBE
 	help
 	  kmscube is an application to test kms/drm drivers.
 
-	  https://cgit.freedesktop.org/mesa/kmscube/
+	  https://gitlab.freedesktop.org/mesa/kmscube
