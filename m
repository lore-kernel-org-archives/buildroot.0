From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:08:04 +0100
Subject: [Buildroot] [PATCH 12/15] erlang-p1-sip: Bump to version 1.0.26
In-Reply-To: <20181126110807.31431-1-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
Message-ID: <20181126110807.31431-13-johan.oudinet@gmail.com>
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
index 4d41b9884c..2cd057b976 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6ac36594921561d0d5502bb824b7408223a3f53560a9d2fa4b0f685c0441baf0 erlang-p1-sip-1.0.17.tar.gz
+sha256 be38cceff8e2207da24805b8e1c926cdf6d63ab116be12cd829f5a3a4e5e58ab erlang-p1-sip-1.0.26.tar.gz
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index a9f572df2d..846633873a 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_SIP_VERSION = 1.0.17
+ERLANG_P1_SIP_VERSION = 1.0.26
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-- 
2.17.1
