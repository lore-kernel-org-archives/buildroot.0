From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Jan 2014 21:06:50 +0100
Subject: [Buildroot] [git commit] iftop: bump to version 1.0pre3
Message-ID: <20140104200733.0C0FB9C3A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdef700af433c4591576369274e185298c4cb0b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iftop/iftop.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index de2f1b1..29ec61a 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-IFTOP_VERSION = 1.0pre2
+IFTOP_VERSION = 1.0pre3
 IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
-
 IFTOP_DEPENDENCIES = ncurses libpcap
-
 IFTOP_LICENSE = GPLv2+
 IFTOP_LICENSE_FILES = COPYING
 
