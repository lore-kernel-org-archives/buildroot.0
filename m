From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:38:46 +0200
Subject: [Buildroot] [git commit] package/xvisor: needs host-dtc
Message-ID: <20200712213507.F2D5B818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=429c56cfdcaba9ff42b4069f6b548261852904f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-dtc is a mandatory dependency since version 0.3.0 and
https://github.com/xvisor/xvisor/commit/e31344c9b5835c8a12bfffb3a359f343b273fab5

Fixes:
 - http://autobuild.buildroot.org/results/3f49302e7d05d666a51db0cb51365620a63e3b40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xvisor/xvisor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index fe3ec05855..394ff7c80b 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
-XVISOR_DEPENDENCIES = host-bison host-flex
+XVISOR_DEPENDENCIES = host-bison host-dtc host-flex
 
 XVISOR_MAKE_TARGETS = all
 
