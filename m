From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:39:44 +0200
Subject: [Buildroot] [git commit] leafpad: add license information
Message-ID: <20140625211213.B18DC9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73992f1680c4ad395e545738fe7c3d01aff494d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leafpad/leafpad.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index b533ea0..6366cab 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -7,5 +7,7 @@
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
+LEAFPAD_LICENSE = GPLv2+
+LEAFPAD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
