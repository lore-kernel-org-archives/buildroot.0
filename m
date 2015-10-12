From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 21:48:10 +0200
Subject: [Buildroot] [git commit] package/dbus: remove empty line from
	dbus.mk
Message-ID: <20151012195536.AE9F581E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=281cbdd0ae70db923922d333213aecca74e5a77d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index abce1fb..84fbdfa 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -18,7 +18,6 @@ define DBUS_USERS
 	dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus user
 endef
 
-
 DBUS_DEPENDENCIES = host-pkgconf expat
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
