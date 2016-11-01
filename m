From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:24:06 +0100
Subject: [Buildroot] [git commit] package/transmission: fix SITE url
Message-ID: <20161101152519.CDA27817EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92fa50ae5107a5b3999a91dc2e3775582aaf6878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/transmission/transmission.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index e0cfc2d..923ba40 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TRANSMISSION_VERSION = 2.92
-TRANSMISSION_SITE = http://download.transmissionbt.com/files
+TRANSMISSION_SITE = https://github.com/transmission/transmission-releases/raw/master
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
 	host-pkgconf \
