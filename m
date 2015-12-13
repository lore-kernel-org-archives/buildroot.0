From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:50:13 +0100
Subject: [Buildroot] [git commit] package/libxml2: Remove autoreconf
Message-ID: <20151213215028.8378E81848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6f1b45e64b1507406ede1ed8728050202c8808c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Autoreconf is not necessary since we do not patch this package anymore.

LIBXML2_AUTORECONF was added back in 2012
https://git.busybox.net/buildroot/commit/package/libxml2?id=aa5d9ba3b86f21be934fdb436525a833bf120305

and apparently not removed along with the patches applied before
https://git.busybox.net/buildroot/commit/package/libxml2?id=dc0e7cfc3e4050ce7c0404b11f747bf1500c50b7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index acfe59f..ee9b2ca 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -7,7 +7,6 @@
 LIBXML2_VERSION = 2.9.3
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
-LIBXML2_AUTORECONF = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
 LIBXML2_CONFIG_SCRIPTS = xml2-config
