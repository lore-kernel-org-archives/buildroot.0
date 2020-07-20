From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 08:18:26 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/qt5: fix
 check-package warnings
Message-ID: <20200720064220.A8C0D811AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133572f483786bcbe5dbf612a2b2961ee112b615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:

https://gitlab.com/buildroot.org/buildroot/-/jobs/622129163

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fde51ad168f65e40404aa027260705eed80bfdeb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d6b995071b..1d9e7a5746 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -21,7 +21,7 @@ endef
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define QT5_QT_CONF_FIXUP
-        $(QT5_INSTALL_QT_CONF)
+	$(QT5_INSTALL_QT_CONF)
 endef
 endif
 
