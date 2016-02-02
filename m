From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue,  2 Feb 2016 14:57:33 -0500
Subject: [Buildroot] [PATCH v2 07/18] erlang-p1-cache-tab: bump to version
	1.0.1
In-Reply-To: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1454443064-14269-8-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1->v2:
  - Fix license file name

 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index 6c5d98a..7739c8c 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = f7ea12b
+ERLANG_P1_CACHE_TAB_VERSION = 1.0.1
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
 ERLANG_P1_CACHE_TAB_LICENSE = GPLv2+
-ERLANG_P1_CACHE_TAB_LICENSE_FILES = COPYING
+ERLANG_P1_CACHE_TAB_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_CACHE_TAB_DEPENDENCIES = erlang-p1-utils
 
 $(eval $(rebar-package))
-- 
2.5.0
