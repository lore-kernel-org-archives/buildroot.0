From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Mar 2017 16:24:15 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] libwebsockets: bump to
	version 2.1.1
Message-ID: <20170307155609.721E381EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3124be629db7546afd42f3664b43d7801865eab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Mosquitto combined with version 2.1.0 of libwebsockets yields a failing
system. Version 2.1.1 restores the websocket interface again.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 71d54786a325e9c1af3352f87434e0a8eab4c726)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index cbd1101..df7221e 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  bcc96aaa609daae4d3f7ab1ee480126709ef4f6a8bf9c85de40aae48e38cce66  libwebsockets-v2.1.0.tar.gz
+sha256	96183cbdfcd6e6a3d9465e854a924b7bfde6c8c6d3384d6159ad797c2e823b4d  libwebsockets-v2.1.1.tar.gz
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index bf46291..983ffce 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v2.1.0
+LIBWEBSOCKETS_VERSION = v2.1.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
