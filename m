From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 11:03:30 +0100
Subject: [Buildroot] [git commit] links: bump to version 2.5
Message-ID: <20120106101008.D52678FFE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fce387097f001c19cdc2761ce6d5f4007d7796f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/links/links.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index 470b13d..52a71f1 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LINKS_VERSION = 2.3pre2
+LINKS_VERSION = 2.5
 LINKS_SITE = http://links.twibright.com/download
 LINKS_CONF_OPT = --without-x
 LINKS_DEPENDENCIES = host-pkg-config
