From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2020 21:24:57 +0200
Subject: [Buildroot] [git commit] package/qt5: fix check-package warnings
Message-ID: <20200703192222.A9B028040F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fde51ad168f65e40404aa027260705eed80bfdeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

https://gitlab.com/buildroot.org/buildroot/-/jobs/622129163

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 4fa687fd58..a2572be097 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -21,7 +21,7 @@ endef
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define QT5_QT_CONF_FIXUP
-        $(QT5_INSTALL_QT_CONF)
+	$(QT5_INSTALL_QT_CONF)
 endef
 endif
 
