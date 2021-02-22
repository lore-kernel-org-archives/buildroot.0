From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 22 Feb 2021 20:46:40 +0100
Subject: [Buildroot] [PATCH] package/iptables: bump to version 1.8.7
Message-ID: <20210222194640.168066-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/iptables/iptables.hash | 2 +-
 package/iptables/iptables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 120e7e4a8..7f1441393 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  a0f4fe0c3eb8faa5bd9c8376d132f340b9558e750c91deb2d5028aa3d0047767  iptables-1.8.6.tar.bz2
+sha256  c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0  iptables-1.8.7.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index dc0146660..ca8178425 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.6
+IPTABLES_VERSION = 1.8.7
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-- 
2.27.0
