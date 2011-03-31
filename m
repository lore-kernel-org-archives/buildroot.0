From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 Mar 2011 15:23:13 +0200
Subject: [Buildroot] [git commit master 1/1] webkit: bump to version 1.2.7
Message-ID: <20110331132414.7E71981D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a70aa0cc5d0980e72677869d9d87e0e4e35e483
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 8483c0d..3a06f43 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WEBKIT_VERSION = 1.2.6
+WEBKIT_VERSION = 1.2.7
 WEBKIT_SITE = http://www.webkitgtk.org
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt \
-- 
1.7.3.4
