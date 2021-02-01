From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 18:23:55 +0100
Subject: [Buildroot] [git commit] package/inadyn: bump to version 2.8.1
Message-ID: <20210201170854.2E7AD814AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e0efeec7c28ed1653cc1d6cea61e7d6ca4da790
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ChangeLog:
- https://github.com/troglobit/inadyn/releases/tag/v2.8
- https://github.com/troglobit/inadyn/releases/tag/v2.8.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.hash | 5 ++---
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 8480e449ca..638f92d119 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,6 +1,5 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.7/inadyn-2.7.tar.xz.md5
-md5  3ab125df504a9755264a9ebeedbfa4de  inadyn-2.7.tar.xz
+# From https://github.com/troglobit/inadyn/releases/download/v2.8.1/inadyn-2.8.1.tar.xz.sha256
+sha256  1185a9fb165bfc5f5b5f66f0dd8a695c9bd78d4b20cd162273eeea77f2d2e685  inadyn-2.8.1.tar.xz
 
 # Locally computed
-sha256  eb03bc9d9c09dfbbc651b43a2eb5a967d0454a8293576df23784710dac50c6a4  inadyn-2.7.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 7888f5a360..c115e8926d 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.7
+INADYN_VERSION = 2.8.1
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
