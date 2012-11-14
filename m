From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:32:10 +0100
Subject: [Buildroot] [git commit] dmalloc: add license info
Message-ID: <20121114214725.1319899FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6737b052b2d75dffb3f4098e85588ea406ccbcb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dmalloc/dmalloc.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index e2fdda4..42e2e64 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -7,6 +7,10 @@ DMALLOC_VERSION:=5.4.3
 DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VERSION).tgz
 DMALLOC_SITE:=http://dmalloc.com/releases
 
+DMALLOC_LICENSE = MIT-like
+# license is in each file, dmalloc.h.1 is the smallest one
+DMALLOC_LICENSE_FILES = dmalloc.h.1
+
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CONF_OPT:= --enable-shlib
 
