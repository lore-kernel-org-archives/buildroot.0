From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 Oct 2019 19:59:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/ytree: bump version to 1.99pl2
Message-ID: <20191001175911.16028-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index a671279558..3405c22d37 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 763e8c2af528174cd738ed8f2eca62579e3edef57ccbd242be7cf181ae15d251  ytree-1.99pl1.tar.gz
+sha256 9d14e173183676bfb5da93ff90909547aa19f888504e45058a91f3bbd9d9112d  ytree-1.99pl2.tar.gz
 sha256 eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 2d2a6946f7..863eba741c 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 1.99pl1
+YTREE_VERSION = 1.99pl2
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0
 YTREE_LICENSE_FILES = COPYING
-- 
2.20.1
