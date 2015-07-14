From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 12:24:03 +0200
Subject: [Buildroot] [git commit] olsr: bump version
Message-ID: <20150714102921.66FDD819CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec9e34c9bb7c60e6fe71529553a87215501ea63a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.hash |    2 +-
 package/olsr/olsr.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
index 5b8abc7..83c48e0 100644
--- a/package/olsr/olsr.hash
+++ b/package/olsr/olsr.hash
@@ -1,2 +1,2 @@
 # From http://www.olsr.org/releases/0.6/SHA256SUM-0.6.8
-sha256	692de2eb144f0be2e1dfc5dc5275b6c61b80af080e8f733e0b26b6a860442d27	olsrd-0.6.8.tar.bz2
+sha256	cc464b29c7740354d815d5faa753fd27c0677d71e8eb42e78abc382996892845 olsrd-0.9.0.2.tar.bz2
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 0dec8dc..a96c898 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OLSR_VERSION_MAJOR = 0.6
-OLSR_VERSION = $(OLSR_VERSION_MAJOR).8
+OLSR_VERSION_MAJOR = 0.9
+OLSR_VERSION = $(OLSR_VERSION_MAJOR).0.2
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
