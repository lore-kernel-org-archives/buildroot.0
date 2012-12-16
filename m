From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 14:30:13 +0100
Subject: [Buildroot] [git commit] libxml2: bump to version 2.9.0
Message-ID: <20121216133044.25B5A9A0BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1cb447c0fc4e471f8cdd4826bdf8d750565dad8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml2/libxml2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 0c84652..0394e29 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBXML2_VERSION = 2.8.0
+LIBXML2_VERSION = 2.9.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
