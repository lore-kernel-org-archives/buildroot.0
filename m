From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:51:23 +0200
Subject: [Buildroot] [git commit] erlang-p1-cache-tab: bump to version 1.0.7
Message-ID: <20170601202859.70115818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb67eaad924fb06ff7f2c0084a6ee4c250c25f1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash | 2 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
index d8b09f9..b6f7fb3 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 752b649f695e9f2777efd6b2d8dfdcc1f435104b4e363f5f0454b99fd009015c erlang-p1-cache-tab-1.0.1.tar.gz
+sha256 9376c14eaeb78c3847c3cf38853bb6e6860fb63959e182deeff5c819b23c95a4 erlang-p1-cache-tab-1.0.7.tar.gz
diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index 8f13123..6f1a139 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = 1.0.1
+ERLANG_P1_CACHE_TAB_VERSION = 1.0.7
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
 ERLANG_P1_CACHE_TAB_LICENSE = Apache-2.0
 ERLANG_P1_CACHE_TAB_LICENSE_FILES = LICENSE.txt
