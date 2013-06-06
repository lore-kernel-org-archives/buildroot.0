From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:08:48 +0200
Subject: [Buildroot] [git commit] socketcand: fix github tarball to use
	commit id
Message-ID: <20130606211258.2B2919A9A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe64434df6c8a5f3516f92caf9c04d6dedda444b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/socketcand/socketcand.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 5c10115..d85eb1a 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SOCKETCAND_VERSION = 7d06986
-SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/master
+SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/$(SOCKETCAND_VERSION)
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_DEPENDENCIES = libconfig
 
