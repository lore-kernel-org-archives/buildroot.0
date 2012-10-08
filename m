From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 21:39:52 +0200
Subject: [Buildroot] [git commit] sylpheed: Bump version to 3.2
Message-ID: <20121008195649.05ED0997FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e856daa89157bb31d2a88abb23542a65e4d0fbaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sylpheed/sylpheed.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 32c0a82..491737e 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -3,7 +3,7 @@
 # sylpheed
 #
 #############################################################
-SYLPHEED_VERSION_MAJOR = 3.1
+SYLPHEED_VERSION_MAJOR = 3.2
 SYLPHEED_VERSION_MINOR = 0
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
