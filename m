From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:11:04 -0500
Subject: [Buildroot] [PATCH 11/18] erlang-p1-sip: bump to version 1.0.0
In-Reply-To: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1453511471-28519-12-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang-p1-sip/erlang-p1-sip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index d017a92..eb963c8 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = fd3e461
+ERLANG_P1_SIP_VERSION = 1.0.0
 ERLANG_P1_SIP_SITE = $(call github,processone,p1_sip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = GPLv2 with OpenSSL exception
 ERLANG_P1_SIP_LICENSE_FILES = COPYING
-ERLANG_P1_SIP_DEPENDENCIES = erlang-p1-stun erlang-p1-tls erlang-p1-utils
+ERLANG_P1_SIP_DEPENDENCIES = erlang-p1_stun erlang-p1-tls erlang-p1-utils
 ERLANG_P1_SIP_INSTALL_STAGING = YES
 
 $(eval $(rebar-package))
-- 
2.5.0
