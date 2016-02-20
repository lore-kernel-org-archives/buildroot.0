From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 18:41:18 +0100
Subject: [Buildroot] [git commit] erlang-p1-cache-tab: bump to version 1.0.1
Message-ID: <20160302202754.8EFFC7FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05db2a14b9fcd113aeead908fbf561b5dba38226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: change the license, it's now Apache-2.0.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index 6c5d98a..8f13123 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = f7ea12b
+ERLANG_P1_CACHE_TAB_VERSION = 1.0.1
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
-ERLANG_P1_CACHE_TAB_LICENSE = GPLv2+
-ERLANG_P1_CACHE_TAB_LICENSE_FILES = COPYING
+ERLANG_P1_CACHE_TAB_LICENSE = Apache-2.0
+ERLANG_P1_CACHE_TAB_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_CACHE_TAB_DEPENDENCIES = erlang-p1-utils
 
 $(eval $(rebar-package))
