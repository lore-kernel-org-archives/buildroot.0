From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 08:39:30 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: update iostat title
Message-ID: <20210518061051.E516B87C11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=104df75e90730af80b6008270d889899f5005547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Specify that iostat 'package' has been removed to be consistent with
other entries

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bc7cb8e32a..7bd2eb1429 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -182,7 +182,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	  The package was renamed to containerd accordingly.
 
 config BR2_PACKAGE_IOSTAT
-	bool "iostat removed"
+	bool "iostat package removed"
 	select BR2_LEGACY
 	help
 	  This package has been removed, use sysstat instead.
