From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:48 -0000
Subject: [Buildroot] [git commit branch/next] xavante: bump version to 2.2.1
Message-ID: <20120802195247.2E7BD8C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4da6b8bd979a49c4ca14fb6003d2b05f6d8c5b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xavante/xavante.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index e6dd312..5eabd1e 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-XAVANTE_VERSION = 2.2.0
+XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
 XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
 
