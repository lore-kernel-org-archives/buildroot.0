From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:01:59 +0100
Subject: [Buildroot] [git commit] iftop: bump to version 1.0pre4
Message-ID: <20140311220647.7D88E9BEF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb28d81137e053266ccd8c0db95aef209292adfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iftop/iftop.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
index 29ec61a..91bd6cc 100644
--- a/package/iftop/iftop.mk
+++ b/package/iftop/iftop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IFTOP_VERSION = 1.0pre3
+IFTOP_VERSION = 1.0pre4
 IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
 IFTOP_DEPENDENCIES = ncurses libpcap
 IFTOP_LICENSE = GPLv2+
