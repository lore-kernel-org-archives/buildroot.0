From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:39 -0300
Subject: [Buildroot] [PATCH 33/54] rubix: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-33-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rubix/rubix.mk | 2 ++
 1 file changed, 2 insertions(+)

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
 
-- 
1.8.5.5
