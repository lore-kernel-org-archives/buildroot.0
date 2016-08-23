From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:55:51 +0200
Subject: [Buildroot] [git commit branch/next] libnetfilter_conntrack: bump
	to version 1.0.6
Message-ID: <20160823155856.37AB081E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03c3fcd5bcf9c1361888119f866eac4b55575b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnetfilter_conntrack/libnetfilter_conntrack.hash | 6 +++---
 package/libnetfilter_conntrack/libnetfilter_conntrack.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
index 67d1e40..de9d1d3 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
@@ -1,3 +1,3 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.5.tar.bz2.{md5sum,sha1sum}
-md5	6aa1bd3c1d0723235ac897087b4cd4e5	libnetfilter_conntrack-1.0.5.tar.bz2
-sha1	9aed8733d98af39d57fffd929c2bea70f1dcba06	libnetfilter_conntrack-1.0.5.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.6.tar.bz2.{md5sum,sha1sum}
+md5	7139c5f408dd9606ffecfd5dcda8175b	libnetfilter_conntrack-1.0.6.tar.bz2
+sha1	015f985a8e171889a67769ba02d070eca53bac07	libnetfilter_conntrack-1.0.6.tar.bz2
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index 33f1294..ec05f6d 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.5
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.6
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
