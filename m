From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 22:02:43 +0200
Subject: [Buildroot] [git commit] olsr: bump to 0.9.0.3
Message-ID: <20161026200342.A6A3B81E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09feb408f2d239d1146141453ad85df866bc4158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.hash | 4 ++--
 package/olsr/olsr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
index e14d52c..c6b1415 100644
--- a/package/olsr/olsr.hash
+++ b/package/olsr/olsr.hash
@@ -1,2 +1,2 @@
-# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.0.2
-sha256	cc464b29c7740354d815d5faa753fd27c0677d71e8eb42e78abc382996892845 olsrd-0.9.0.2.tar.bz2
+# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.0.3
+sha256	1f038ed3ea72e4f73dfc9701de83de7313f5049161c8df17b9aaeba8e9711e92 olsrd-0.9.0.3.tar.bz2
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 60c8098..5a456a9 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OLSR_VERSION_MAJOR = 0.9
-OLSR_VERSION = $(OLSR_VERSION_MAJOR).0.2
+OLSR_VERSION = $(OLSR_VERSION_MAJOR).0.3
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
