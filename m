From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Apr 2012 23:19:18 +0200
Subject: [Buildroot] [git commit] pcre: bump to 8.30
Message-ID: <20120402212946.7642C969DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60a395708d99b1787800bedd983450d0097ce6af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pcre/pcre.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index d64106e..db896fd 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCRE_VERSION = 8.20
+PCRE_VERSION = 8.30
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
 
