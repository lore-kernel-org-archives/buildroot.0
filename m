From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:46 -0500
Subject: [Buildroot] [PATCH 11/11] portmap: add license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-12-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/portmap/portmap.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 1d8c166..8203555 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -7,6 +7,8 @@
 PORTMAP_VERSION = 6.0
 PORTMAP_SOURCE = portmap-$(PORTMAP_VERSION).tgz
 PORTMAP_SITE = http://neil.brown.name/portmap
+PORTMAP_LICENSE = BSD-4c (portmap.c) SunRPC License (portmap.c from_local.c)
+PORTMAP_LICENSE_FILES = portmap.c from_local.c
 PORTMAP_SBINS = portmap pmap_dump pmap_set
 
 PORTMAP_FLAGS = NO_TCP_WRAPPER=1 NO_PIE=1 NO_PERROR=1
-- 
1.7.9.5
