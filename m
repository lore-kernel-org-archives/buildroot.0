From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  8 Apr 2020 11:36:19 +0200
Subject: [Buildroot] [PATCH] package/netdata: bump to 1.21.0
Message-ID: <20200408093619.649485-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/netdata/netdata.hash | 2 +-
 package/netdata/netdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
index 6c79e97017..2d6bd2a9a8 100644
--- a/package/netdata/netdata.hash
+++ b/package/netdata/netdata.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c739e0fa8d6d7f433c0c7c8016b763e8f70519d67f0b5e7eca9ee5318f210d90  netdata-1.20.0.tar.gz
+sha256 b6a80ac1e86d8a8d6fa16bba2ad15e8a8e5a89e3437cb7f30c538d11b95b5325  netdata-1.21.0.tar.gz
 sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 529eb24e9c..34d6d53d0f 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETDATA_VERSION = 1.20.0
+NETDATA_VERSION = 1.21.0
 NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
 NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
-- 
2.25.0
