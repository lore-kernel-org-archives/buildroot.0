From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:19 +0200
Subject: [Buildroot] [PATCH 06/11] erlang-p1-tls: bump to version b070004
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-7-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index d6e5801..d706797 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 53f0478
+ERLANG_P1_TLS_VERSION = b070004
 ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = GPLv2+
 ERLANG_P1_TLS_LICENSE_FILES = COPYING
-- 
2.1.4
