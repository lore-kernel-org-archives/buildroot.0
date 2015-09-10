From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 14:06:38 +0200
Subject: [Buildroot] [git commit] directfb-examples: do not install to
	staging
Message-ID: <20150910122137.247FF807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=127aef0261a47f42de7c9b5ae76afad0bf4317ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DirectFB examples are just examples, there is no reason to install
them to the staging directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb-examples/directfb-examples.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index f40a030..ac8e61c 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -9,7 +9,6 @@ DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
 DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
-DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
 ifeq ($(BR2_STATIC_LIBS),y)
