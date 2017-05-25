From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 01:12:06 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/dstat: bump version to 0.7.3
Message-ID: <20170525231207.22360-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved tarballs to github according to
http://dag.wiee.rs/home-made/dstat/

"or grab the latest 0.7.3 tarball at:
 https://github.com/dagwieers/dstat/archive/0.7.3.tar.gz"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dstat/dstat.hash | 2 +-
 package/dstat/dstat.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/dstat/dstat.hash b/package/dstat/dstat.hash
index f70156174..a4dbcc981 100644
--- a/package/dstat/dstat.hash
+++ b/package/dstat/dstat.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  34a986d9d7c028bd9dcb6b2ef1c740f7220de5c9cf976870a2b62aca23b33bae  dstat-0.7.2.tar.bz2
+sha256 46e63821857b69fbc60cb2c7d893ccdd6f31cd9ef24b8bb0b68951e1c7374898  dstat-0.7.3.tar.gz
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index b53532897..9c4b44576 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DSTAT_VERSION = 0.7.2
-DSTAT_SOURCE = dstat-$(DSTAT_VERSION).tar.bz2
-DSTAT_SITE = http://dag.wieers.com/home-made/dstat
+DSTAT_VERSION = 0.7.3
+DSTAT_SITE = $(call github,dagwieers,dstat,$(DSTAT_VERSION))
 DSTAT_LICENSE = GPL-2.0
 DSTAT_LICENSE_FILES = COPYING
 
-- 
2.11.0
