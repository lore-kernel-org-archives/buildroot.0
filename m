From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:17 +0200
Subject: [Buildroot] [PATCH 04/11] erlang-p1-utils: bump to version 1bf99f9
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-5-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-utils/erlang-p1-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 0e63031..c01d6d5 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 940f42d
+ERLANG_P1_UTILS_VERSION = 1bf99f9
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = GPLv2+
 ERLANG_P1_UTILS_LICENSE_FILES = COPYING
-- 
2.1.4
