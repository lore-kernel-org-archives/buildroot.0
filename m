From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 May 2013 12:02:02 +0200
Subject: [Buildroot] [git commit] bellagio: add license information
Message-ID: <20130517100437.169459A2BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce774eba9cff7b193a8d395c91b23c703088f159
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/bellagio/bellagio.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/bellagio/bellagio.mk b/package/multimedia/bellagio/bellagio.mk
index 6aadbbf..c612b95 100644
--- a/package/multimedia/bellagio/bellagio.mk
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -8,5 +8,7 @@ BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
 BELLAGIO_SITE = http://downloads.sourceforge.net/project/omxil/omxil/Bellagio%20$(BELLAGIO_VERSION)
 BELLAGIO_AUTORECONF = YES
 BELLAGIO_INSTALL_STAGING = YES
+BELLAGIO_LICENSE = LGPLv2.1+
+BELLAGIO_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
