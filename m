From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 14:30:29 +0100
Subject: [Buildroot] [git commit] libxslt: bump to version 1.1.28
Message-ID: <20121216133044.E3E32998E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37f82a44abc024c64eee8e03d516403caa7a0b2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxslt/libxslt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index aa594c2..a35b955 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBXSLT_VERSION = 1.1.27
+LIBXSLT_VERSION = 1.1.28
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
