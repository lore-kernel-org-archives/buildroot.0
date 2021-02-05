From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 14:03:28 +0100
Subject: [Buildroot] [git commit] package/libpwquality: bump version to 1.4.4
Message-ID: <20210205124328.869EF815F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74e1fd6c421650c6fa5ccb7e63aab955da4486ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libpwquality/libpwquality.hash | 2 +-
 package/libpwquality/libpwquality.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
index 07c50ed24e..1469bc0b7a 100644
--- a/package/libpwquality/libpwquality.hash
+++ b/package/libpwquality/libpwquality.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5263e09ee62269c092f790ac159112aed3e66826a795e3afec85fdeac4281c8e  libpwquality-1.4.2.tar.bz2
+sha256  d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff44278d276141752a545  libpwquality-1.4.4.tar.bz2
 sha256  aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baee  COPYING
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index a2fb00415f..7c0c5df38e 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPWQUALITY_VERSION = 1.4.2
+LIBPWQUALITY_VERSION = 1.4.4
 LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
 LIBPWQUALITY_SITE = https://github.com/libpwquality/libpwquality/releases/download/libpwquality-$(LIBPWQUALITY_VERSION)
 LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
