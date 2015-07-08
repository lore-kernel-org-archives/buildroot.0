From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:23 +0200
Subject: [Buildroot] [PATCH 10/11] erlang-p1-sip: bump to version fd3e461
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-11-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-sip/erlang-p1-sip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index b895f59..d017a92 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = bba4459
+ERLANG_P1_SIP_VERSION = fd3e461
 ERLANG_P1_SIP_SITE = $(call github,processone,p1_sip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = GPLv2 with OpenSSL exception
 ERLANG_P1_SIP_LICENSE_FILES = COPYING
-- 
2.1.4
