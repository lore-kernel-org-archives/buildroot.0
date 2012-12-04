From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 14:47:19 -0800
Subject: [Buildroot] [git commit] screen: add license information
Message-ID: <20121204225020.758449995B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29d4d2c6c484b768d7eb36b03f22cb60ac9c285a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: GPLv2+ as pointed out by Arnout]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/screen/screen.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 8786322..dd8a732 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -6,6 +6,8 @@
 
 SCREEN_VERSION = 4.0.3
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
+SCREEN_LICENSE = GPLv2+
+SCREEN_LICENSE_FILES = COPYING
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no \
 	CFLAGS="$(TARGET_CFLAGS) -DTERMINFO"
