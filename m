From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Apr 2012 14:14:11 +0200
Subject: [Buildroot] [git commit] taglib: bump to version 1.7.1
Message-ID: <20120420134204.C1D8C96B30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a8e6e03b24ed7a03a985f7131f614ac35f98314
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/taglib/taglib.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/taglib/taglib.mk b/package/multimedia/taglib/taglib.mk
index ce6adeb..da2db0c 100644
--- a/package/multimedia/taglib/taglib.mk
+++ b/package/multimedia/taglib/taglib.mk
@@ -3,7 +3,8 @@
 # taglib
 #
 #############################################################
-TAGLIB_VERSION = 1.7
+
+TAGLIB_VERSION = 1.7.1
 TAGLIB_SOURCE = taglib-$(TAGLIB_VERSION).tar.gz
 TAGLIB_SITE = http://developer.kde.org/~wheeler/files/src
 TAGLIB_INSTALL_STAGING = YES
