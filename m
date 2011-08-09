From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:37 +0200
Subject: [Buildroot] [PATCH 04/22] dbus-glib: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-4-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
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
1.7.2.5
