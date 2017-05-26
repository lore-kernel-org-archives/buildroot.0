From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 14:57:19 +0200
Subject: [Buildroot] [git commit] package/dstat: bump version to 0.7.3
Message-ID: <20170601202856.017EF8261C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49867a4325d2c59a86e647c8461dad316f539b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream moved tarballs to github according to
http://dag.wiee.rs/home-made/dstat/

"or grab the latest 0.7.3 tarball at:
 https://github.com/dagwieers/dstat/archive/0.7.3.tar.gz"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dstat/dstat.hash | 2 +-
 package/dstat/dstat.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/dstat/dstat.hash b/package/dstat/dstat.hash
index f701561..a4dbcc9 100644
--- a/package/dstat/dstat.hash
+++ b/package/dstat/dstat.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  34a986d9d7c028bd9dcb6b2ef1c740f7220de5c9cf976870a2b62aca23b33bae  dstat-0.7.2.tar.bz2
+sha256 46e63821857b69fbc60cb2c7d893ccdd6f31cd9ef24b8bb0b68951e1c7374898  dstat-0.7.3.tar.gz
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index b535328..9c4b445 100644
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
 
