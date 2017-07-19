From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:04:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] irssi: drop obsolete
	configure option
Message-ID: <20170720055507.4D2B2800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94660b2a950ec6d6f288090c27302fc89d50542b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The configure option --with-ncurses has been removed in version 1.0.0
and thus is no longer needed.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a97b1e03fe779a67b4ca14f9e08fd4a316e81be5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 12ab57b..2b3bff4 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -15,7 +15,6 @@ IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses openssl
 
 IRSSI_CONF_OPTS = \
 	--disable-glibtest \
-	--with-ncurses=$(STAGING_DIR)/usr \
 	--without-perl
 
 ifeq ($(BR2_PACKAGE_IRSSI_PROXY),y)
