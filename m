From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:10:59 +0100
Subject: [Buildroot] [PATCH 06/22] erlang-p1-sip: Bump to version 1.0.30
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-7-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 2cd057b976..4fd5024ffb 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 be38cceff8e2207da24805b8e1c926cdf6d63ab116be12cd829f5a3a4e5e58ab erlang-p1-sip-1.0.26.tar.gz
+sha256 4c8dbba1dfcbb16a300fea5fd75f5ab2a145f011fa1ebff37e31e1672a9bc285 erlang-p1-sip-1.0.30.tar.gz
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 846633873a..f7f10caf94 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.26
+ERLANG_P1_SIP_VERSION = 1.0.30
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
