From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 00:07:51 +0100
Subject: [Buildroot] [git commit] rpcbind: correct download URL
Message-ID: <20121106231131.0126099C05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=456f9de2fd6feffa465aeef44fb3d0082e3b0e0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_SOURCEFORGE_MIRROR is gone.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpcbind/rpcbind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index d9a80de..de9a421 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 RPCBIND_VERSION = 0.2.0
-RPCBIND_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
+RPCBIND_SITE    = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE  = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3c
 RPCBIND_LICENSE_FILES = COPYING
