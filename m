From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jun 2012 21:54:27 +0200
Subject: [Buildroot] [git commit] bison: bump to version 2.5.1
Message-ID: <20120610201113.D3C5D96E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4628f823ee0f7dcea55d7111bcfdafb664843351
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/bison.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index a1de39a..51325bd 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BISON_VERSION = 2.5
+BISON_VERSION = 2.5.1
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 
 BISON_CONF_ENV += ac_cv_path_M4=/usr/bin/m4
