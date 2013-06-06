From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:01:40 +0200
Subject: [Buildroot] [git commit] libcofi: fix github tarball to use commit
	id
Message-ID: <20130606211254.64F259A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bb2757c461271f4458294d417f440f839513e33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcofi/libcofi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
index 6e9c564..88d51d3 100644
--- a/package/libcofi/libcofi.mk
+++ b/package/libcofi/libcofi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
-LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master
+LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/$(LIBCOFI_VERSION)
 LIBCOFI_LICENSE = LGPLv2.1
 LIBCOFI_LICENSE_FILES = README.md
 
