From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2021 12:04:21 +0100
Subject: [Buildroot] [git commit] package/minizip: bump to version 2.10.6
Message-ID: <20210106104732.4D77D83FED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5124f7eb035a9ff86c753a773ea297add769fd6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/nmoinvaz/minizip/releases/tag/2.10.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 9262f3a3e7..f150770ae9 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c6420d3f3509e722178d9130a57cb77537b34900e7b67acca7e3e2858846939  minizip-2.10.5.tar.gz
+sha256  c2889690b1a1f55898d37d3fb51f05183a4861fb7d53ab702c6a5777bf232b75  minizip-2.10.6.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 9e60bc2aab..b2294fb530 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.10.5
+MINIZIP_VERSION = 2.10.6
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
