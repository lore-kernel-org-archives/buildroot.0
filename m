From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:39:56 +0200
Subject: [Buildroot] [git commit branch/next] libart: handle libart2-config
	script
Message-ID: <20130511204538.9BAC69A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e62d01535ab78e8ff80b730e9b2df903f0747d0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libart/libart.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 0505ff5..822dbf1 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -9,5 +9,6 @@ LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
 LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
+LIBART_CONFIG_SCRIPTS = libart2-config
 
 $(eval $(autotools-package))
