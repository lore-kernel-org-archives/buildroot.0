From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:48 -0000
Subject: [Buildroot] [git commit branch/next] wsapi: bump version to 1.5
Message-ID: <20120802195247.1F0B38C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66de45f907836f06c928f186dab6423d0c23f751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
 
