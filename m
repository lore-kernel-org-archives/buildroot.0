From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:46 -0000
Subject: [Buildroot] [git commit] package/netsniff-ng: bump to version 0.6.6
Message-ID: <20190602201234.59B2C81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ab75e370a8a18cab920f5080af7be512030edaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to new released version:

    https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.6

Changelog:

    implement rotating capture files in netsniff-ng
    fixed '--in -' to work again with STDIN in trafgen
    fixed -t 0 option to use sendto in trafgen
    checksum calculation for ICMP and TCP in astraceroute
    fix for reading mirrors from file in astraceroute
    use GZIP_ENV instead of GZIP in build system
    added error handling for mismatched address families in mausezahn

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsniff-ng/netsniff-ng.hash | 2 +-
 package/netsniff-ng/netsniff-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 706c9461cf..d44c762660 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256 4966821510079bb13722b9fbb4b7567e44b1b4c3e1b1e7ad95f417a89be5d795 netsniff-ng-0.6.5.tar.xz
+sha256 7949d38eb5b507700ea0f3c87e9f804d87b43f86ea5de0e961451044c2d3dba2  netsniff-ng-0.6.6.tar.xz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 415e86def1..283ecaf245 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.5
+NETSNIFF_NG_VERSION = 0.6.6
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
