From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jul 2013 22:59:57 +0200
Subject: [Buildroot] [git commit] nettle: bump to version 2.7.1
Message-ID: <20130715211528.A097E9A34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02695c0cbbbbe4dbc544f76b4b6e9972cd174678
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nettle/nettle.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index b772d3a..e86d3e8 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 2.7
+NETTLE_VERSION = 2.7.1
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
