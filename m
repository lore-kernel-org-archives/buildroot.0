From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:57 +0100
Subject: [Buildroot] [PATCH 14/18] package/erlang-p1-stun: bump version to
 1.0.39
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-14-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stun/erlang-p1-stun.hash | 4 ++--
 package/erlang-p1-stun/erlang-p1-stun.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index bf569201b8..fb56b8f4e6 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 87cfd9d75c7b956b4c26c9e94492737a4528abf4b09f4f7d89a40abaa0dc088a erlang-p1-stun-1.0.29.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
+sha256  05d2f31f172883d2301a93cd141e6b930dfdd01e10b6aacf806becc3674973d8  erlang-p1-stun-1.0.39.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index ff2899ffbe..f762e7f45c 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 1.0.29
+ERLANG_P1_STUN_VERSION = 1.0.39
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
 ERLANG_P1_STUN_LICENSE = Apache-2.0
 ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
