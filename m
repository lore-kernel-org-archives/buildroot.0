From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] dbus-glib: remove --program-prefix
Message-ID: <20110912052632.836C18D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=63dfeb295fa4b0a515f1fcd188e9902db3d27070
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus-glib/dbus-glib.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 6058b23..7c4e65b 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -13,7 +13,6 @@ DBUS_GLIB_CONF_ENV = ac_cv_have_abstract_sockets=yes \
 		have_abstract_sockets=yes
 
 DBUS_GLIB_CONF_OPT = --localstatedir=/var \
-		--program-prefix="" \
 		--disable-tests \
 		--disable-xml-docs \
 		--with-introspect-xml=$(DBUS_HOST_INTROSPECT) \
-- 
1.7.3.4
