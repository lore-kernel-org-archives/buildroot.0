From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:38:14 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-sip: bump to version
 1.0.26
Message-ID: <20181202071600.9CC97803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2090c21eef467907309076d62a8860cbd85911b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
