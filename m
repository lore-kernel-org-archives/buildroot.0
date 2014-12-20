From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 15:52:26 +0100
Subject: [Buildroot] [git commit] package/libdvbcsa: Update SITE url
Message-ID: <20141220145242.42D7F8055C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f1bcdb74a9623fd4beebf4040d9e78212c15ca0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

old SITE is now password-protected

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdvbcsa/libdvbcsa.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
index ef1d957..1472537 100644
--- a/package/libdvbcsa/libdvbcsa.mk
+++ b/package/libdvbcsa/libdvbcsa.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBDVBCSA_VERSION = 1.1.0
-LIBDVBCSA_SITE = http://download.videolan.org/pub/videolan/libdvbcsa/$(LIBDVBCSA_VERSION)
+LIBDVBCSA_SITE = http://get.videolan.org/libdvbcsa/$(LIBDVBCSA_VERSION)
 LIBDVBCSA_LICENSE = GPLv2+
 LIBDVBCSA_LICENSE_FILES = COPYING
 LIBDVBCSA_INSTALL_STAGING = YES
