From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 16 May 2013 17:02:36 -0700
Subject: [Buildroot] [PATCH 2/2] bellagio: add license information
In-Reply-To: <1368748956-15255-1-git-send-email-gilles.talis@gmail.com>
References: <1368748956-15255-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1368748956-15255-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
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
-- 
1.7.4.1
