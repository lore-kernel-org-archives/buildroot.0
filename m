From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Sep 2012 22:40:18 +0200
Subject: [Buildroot] [git commit] automake: bump to version 1.11.6
Message-ID: <20120909210323.6966D9702E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb07eb9eee6c6084e694711c0a924dcfd3661c52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/automake/automake.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 3c19085..477b10b 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-AUTOMAKE_VERSION = 1.11.5
+AUTOMAKE_VERSION = 1.11.6
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
+AUTOMAKE_LICENSE = GPLv2+
+AUTOMAKE_LICENSE_FILES = COPYING
 
 AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
 
