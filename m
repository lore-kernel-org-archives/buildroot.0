From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 16:33:42 +0200
Subject: [Buildroot] [git commit] rubix: add license information
Message-ID: <20140626143652.B1D3B9D0C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a69e26ac73fe14b968edbca752b12c44959f2394
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rubix/rubix.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index 732f807..5427830 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -8,6 +8,8 @@ RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
 RUBIX_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Rubix
 RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
+RUBIX_LICENSE = Public Domain
+RUBIX_LICENSE_FILES = LICENCE
 
 RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
 
