From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Sep 2012 22:52:20 +0200
Subject: [Buildroot] [git commit] bison: bump to version 2.6.2
Message-ID: <20120909210324.C4D6499590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=826407fa55546057612ed9709eee735a1be37924
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPLv3+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/bison.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index d0c9077..8c33a7a 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-BISON_VERSION = 2.5.1
+BISON_VERSION = 2.6.2
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
-
-BISON_CONF_ENV += ac_cv_path_M4=/usr/bin/m4
-BISON_DEPENDENCIES += m4
+BISON_LICENSE = GPLv3+
+BISON_LICENSE_FILES = COPYING
+BISON_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
+BISON_DEPENDENCIES = m4
 
 define BISON_DISABLE_EXAMPLES
 	echo 'all install:' > $(@D)/examples/Makefile
