From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:19:40 +0100
Subject: [Buildroot] [git commit] wsapi: bump to version 1.6
Message-ID: <20140113222142.4B6739C4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8af8db879ff51d4f1626603835f89c9f55102759
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wsapi/wsapi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index f1ea9b5..9171b71 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WSAPI_VERSION = 1.5-1
+WSAPI_VERSION = 1.6-1
 WSAPI_LICENSE = MIT
 
 $(eval $(luarocks-package))
