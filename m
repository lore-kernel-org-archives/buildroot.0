From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Mon, 06 May 2013 10:19:39 -0600
Subject: [Buildroot] [PATCH] Update webkit download URL
Message-ID: <1367857179.4665.19.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael J. Hammel <mjhammel@graphics-muse.org>
---
 package/webkit/webkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index d37601f..264bcad 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 WEBKIT_VERSION = 1.2.7
-WEBKIT_SITE = http://www.webkitgtk.org
+WEBKIT_SITE = http://www.webkitgtk.org/releases
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-flex host-bison host-gperf icu libcurl
libxml2 \
        libxslt libgtk2 sqlite enchant libsoup jpeg libgail
-- 
1.7.7.6
