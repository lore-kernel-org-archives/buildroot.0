From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 00:11:29 +0100
Subject: [Buildroot] [git commit] package/usbredir: update to version 0.6
Message-ID: <20130204232542.6D20C9A928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f47ae4ea0f67e1ae093365dc73bf82b7e7fdd80a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usbredir/usbredir.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index f0530a7..efdb1be 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBREDIR_VERSION         = 0.4.4
+USBREDIR_VERSION         = 0.6
 USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
 USBREDIR_SITE            = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE         = LGPLv2.1+
