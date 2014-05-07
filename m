From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 10:27:01 +0200
Subject: [Buildroot] [git commit] memstat: add license information
Message-ID: <20140507120710.94CF09CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edf4dcc3ae8ff4f3355606277a6e28fda8b26050
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/memstat/memstat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
