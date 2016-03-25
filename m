From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 10:49:23 +0100
Subject: [Buildroot] [git commit] qwt: fix typo in EGL option name
Message-ID: <20160325094949.CDFF481861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b634298e1dc37a896da17cfbec9a568743b113b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a typo introduced in commit
a976ee0dc834c56e67e1c832ded00ce23b5ccdb0.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qwt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 6b394e3..04b6922 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_QWT_MATHML
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEG && BR2_PACKAGE_QT) || \
+	depends on (BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_QT5)
 	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
