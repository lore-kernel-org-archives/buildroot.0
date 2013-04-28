From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:52:12 +0200
Subject: [Buildroot] [git commit] directfb-examples: adding license
	information
Message-ID: <20130428205746.30AC99B8AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea5bfcae5fc777c6677d19ca00059c0094188f3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb-examples/directfb-examples.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 1342047..14e544c 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -7,6 +7,8 @@
 DIRECTFB_EXAMPLES_VERSION = 1.6.0
 DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
+DIRECTFB_EXAMPLES_LICENSE = MIT
+DIRECTFB_EXAMPLES_LICENSE_FILE = COPYING
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
