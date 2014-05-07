From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 14:02:36 +0200
Subject: [Buildroot] [git commit] portmap: add license information
Message-ID: <20140507120710.EF3E79CB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2eced53d712b1ee691b49532d79f8ee25a34835
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/portmap/portmap.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
