From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 09:15:38 +0200
Subject: [Buildroot] [git commit] alsa-lib: add license information for
	aserver
Message-ID: <20160705071604.3561E81DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=582fdaacd7c40d0d7305279acc963f11a1047c84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/alsa-lib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index c2120c9..f1958de 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -7,8 +7,8 @@
 ALSA_LIB_VERSION = 1.1.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
-ALSA_LIB_LICENSE = LGPLv2.1+
-ALSA_LIB_LICENSE_FILES = COPYING
+ALSA_LIB_LICENSE = LGPLv2.1+ (library), GPLv2+ (aserver)
+ALSA_LIB_LICENSE_FILES = COPYING aserver/COPYING
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
 ALSA_LIB_AUTORECONF = YES
