From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 14:25:29 +0000
Subject: [Buildroot] [PATCH 3/4] libplist: download from the official
	project website and use a tar.bz2
In-Reply-To: <1448461530-56142-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448461530-56142-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1448461530-56142-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libplist/libplist.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index b87c5ba..7f60b5e 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LIBPLIST_VERSION = 1.12
-LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
+LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
+LIBPLIST_SITE = http://www.libimobiledevice.org/downloads
 LIBPLIST_DEPENDENCIES = libxml2 host-pkgconf
 LIBPLIST_INSTALL_STAGING = YES
 LIBPLIST_LICENSE = LGPLv2.1+
-- 
2.4.10
