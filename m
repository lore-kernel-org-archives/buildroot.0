From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:22 +0200
Subject: [Buildroot] [PATCH 09/11] erlang-p1-stun: bump to version a3dce07
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-10-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stun/erlang-p1-stun.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index 7b4b1a9..7920347 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = a7c07b6
+ERLANG_P1_STUN_VERSION = a3dce07
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = GPLv2+
 ERLANG_P1_STUN_LICENSE_FILES = COPYING
-- 
2.1.4
