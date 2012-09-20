From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 14:11:39 +0200
Subject: [Buildroot] [git commit] leafpad: needs host-intltool
Message-ID: <20120920124824.D636A9964E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fee31757683e39dba28527215e9e7fa6150c52cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/d313a67b3deca262844d1043eafa5f6c5b6b7cad/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/leafpad/leafpad.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index ede8c58..b06e655 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -6,7 +6,7 @@
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
-LEAFPAD_DEPENDENCIES = libgtk2
+LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 
 $(eval $(autotools-package))
 
