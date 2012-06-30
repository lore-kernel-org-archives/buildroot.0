From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Jun 2012 23:46:12 +0200
Subject: [Buildroot] [git commit] wsapi: bump version to 1.5
Message-ID: <20120630215452.E78BD8F313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66de45f907836f06c928f186dab6423d0c23f751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wsapi/wsapi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index f9ab334..cce7780 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WSAPI_VERSION = 1.3.4
+WSAPI_VERSION = 1.5
 WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
 WSAPI_DEPENDENCIES = coxpcall luafilesystem rings
 
