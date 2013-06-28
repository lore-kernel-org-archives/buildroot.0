From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:44:56 +0200
Subject: [Buildroot] [git commit] rdesktop: define license
Message-ID: <20130628195145.A0F429B292@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c3b56fb8de761abced19de129ba971dc1378965
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license has an openssl exception]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rdesktop/rdesktop.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index fa7359c..ea2ca0a 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -9,5 +9,7 @@ RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
 RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
+RDESKTOP_LICENSE = GPLv2+ with exceptions
+RDESKTOP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
