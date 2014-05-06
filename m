From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:37 -0500
Subject: [Buildroot] [PATCH 02/11] memstat: add license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-3-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/memstat/memstat.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 8f1d96d..5e96405 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -7,6 +7,8 @@
 MEMSTAT_VERSION = 0.8
 MEMSTAT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/memstat
 MEMSTAT_SOURCE = memstat_$(MEMSTAT_VERSION).tar.gz
+MEMSTAT_LICENSE = GPL
+MEMSTAT_LICENSE_FILES = debian/copyright
 
 define MEMSTAT_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)" \
-- 
1.7.9.5
