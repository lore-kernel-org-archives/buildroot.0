From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:06:15 +0200
Subject: [Buildroot] [git commit] irssi: drop obsolete configure option
Message-ID: <20170619200805.A0BF97FD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a97b1e03fe779a67b4ca14f9e08fd4a316e81be5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure option --with-ncurses has been removed in version 1.0.0
and thus is no longer needed.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irssi/irssi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index ae7986c..ef9d0aa 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -15,7 +15,6 @@ IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
 
 IRSSI_CONF_OPTS = \
 	--disable-glibtest \
-	--with-ncurses=$(STAGING_DIR)/usr \
 	--without-perl
 
 ifeq ($(BR2_PACKAGE_IRSSI_PROXY),y)
