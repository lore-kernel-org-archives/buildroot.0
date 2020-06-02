From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  2 Jun 2020 22:57:36 +0200
Subject: [Buildroot] [PATCH v1] package/iptables: bump version to 1.8.4
Message-ID: <20200602205736.23497-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For changelog details see [1].

[1] https://netfilter.org/projects/iptables/files/changes-iptables-1.8.4.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iptables/iptables.hash | 4 ++--
 package/iptables/iptables.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 2e149aa11b..2811daf5e3 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256 a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80  iptables-1.8.3.tar.bz2
+sha256  993a3a5490a544c2cbf2ef15cf7e7ed21af1845baf228318d5c36ef8827e157c  iptables-1.8.4.tar.bz2
 # Locally calculated
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 7b964aaf41..4dc7a174a1 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.3
+IPTABLES_VERSION = 1.8.4
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-- 
2.26.2
