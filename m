From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 25 Sep 2018 11:11:52 +0200
Subject: [Buildroot] [PATCH] netsniff-ng: bump to version 0.6.5
Message-ID: <1537866712-28813-1-git-send-email-tklauser@distanz.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 package/netsniff-ng/netsniff-ng.hash | 2 +-
 package/netsniff-ng/netsniff-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 576e000878bb..706c9461cf66 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256 fd67150e0954b7079b6d0c72fb0ef1f34091357ad559b45c68e8752376bdc307 netsniff-ng-0.6.4.tar.xz
+sha256 4966821510079bb13722b9fbb4b7567e44b1b4c3e1b1e7ad95f417a89be5d795 netsniff-ng-0.6.5.tar.xz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index fb1c2c7a4eae..77d89214257d 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.4
+NETSNIFF_NG_VERSION = 0.6.5
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
-- 
2.18.0.130.g98da2f6b3e4a
