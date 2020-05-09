From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 21:24:53 +0200
Subject: [Buildroot] [git commit] package/netsniff-ng: bump to version 0.6.7
Message-ID: <20200509193443.9282F911F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2383d5ae12b383ffc817af7f09fbf435782623e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1. trafgen: reset errno before calling sscanf in str2mac (@troglobit, #213)
2. ifpps: fix iface stat parsing if interface name contains uppercase
   characters (@bganne, #215)
3. mausezahn: fix display of missing argument error (@micrictor, #217)
4. mausezahn: support -R to set packet priority (@pmachata)
5. netsniff-ng: handle various malformed packets in protocol dissectors
   (@nathaniellives, #221)

Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsniff-ng/netsniff-ng.hash | 2 +-
 package/netsniff-ng/netsniff-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index c9408ccbdb..80736f85c2 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256  7949d38eb5b507700ea0f3c87e9f804d87b43f86ea5de0e961451044c2d3dba2  netsniff-ng-0.6.6.tar.xz
+sha256  96d85f2d216abcf6ba0ff610809b62c3a6430e21cbdd7bfef48cd9bde074848f  netsniff-ng-0.6.7.tar.xz
 # Locally computed
 sha256  b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e0dc0282a4db2d  README
 sha256  8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302fff4262a235c387  COPYING
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 283ecaf245..46f1b3d152 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.6
+NETSNIFF_NG_VERSION = 0.6.7
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
