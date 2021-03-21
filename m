From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Mar 2021 15:38:32 +0100
Subject: [Buildroot] [PATCH v1] package/xtables-addons: bump version to 3.17
Message-ID: <20210321143832.5852-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog ([1]):

  v3.18 (2021-03-11)
  ==================
  - xt_pknock: fix a build failure on ARM 32-bit

  v3.17 (2021-02-28)
  ==================
  - xt_pknock: cure a NULL deref

  v3.16 (2021-02-24)
  ==================
  - xt_pknock: build fix for ILP32 targets

  v3.15 (2021-02-05)
  ==================
  - xt_ECHO: support new function signature of security_skb_classify_flow
  - xt_lscan: add --mirai option
  - Support for Linux 5.11

  v3.14 (2020-11-24)
  ==================
  - DELUDE, ECHO, TARPIT: use actual tunnel socket (ip_route_me_harder).
  - geoip: scripts for use with MaxMind DB have been brought back,
    partly under new names.
  - Gave xt_geoip_fetch a more fitting name, xt_geoip_query.

[1] https://fossies.org/linux/privat/xtables-addons-3.18.tar.xz/xtables-addons-3.18/doc/changelog.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 2cfb91178e..a103fa3b52 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  893c0c4ea09759cda1ab7e68f1281d125e59270f7b59e446204ce686c6a76d65  xtables-addons-3.13.tar.xz
+sha256  2a640535f209ec59467b8c8b4343b446801a21a112a3fc189818d6e2697f5cf1  xtables-addons-3.17.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 55e1a5d01b..feed054e88 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.13
+XTABLES_ADDONS_VERSION = 3.17
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
-- 
2.30.2
