From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:27:03 +0200
Subject: [Buildroot] [git commit] erlang-p1-cache-tab: bump to version
	f7ea12b
Message-ID: <20150711103326.28E61803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7926943ae56f9dec383aac0b5d1189a5993cba3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index f651b06..6c5d98a 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = 7b89d6a
+ERLANG_P1_CACHE_TAB_VERSION = f7ea12b
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
 ERLANG_P1_CACHE_TAB_LICENSE = GPLv2+
 ERLANG_P1_CACHE_TAB_LICENSE_FILES = COPYING
