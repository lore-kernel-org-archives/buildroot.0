From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:51 +0100
Subject: [Buildroot] [PATCH 08/18] package/erlang-p1-mqtree: bump version to
 1.0.10
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-8-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-mqtree/erlang-p1-mqtree.hash | 4 ++--
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
index 43e98d0699..cf1a880cb8 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 034d564e92ca8e9d66668548ea510d2cf9fdbad40609622a87374aa907110884 erlang-p1-mqtree-1.0.5.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  4f86e272a97152d3f5166dad583dc1b5bda9582f6777f6294fb8328def8b2189  erlang-p1-mqtree-1.0.10.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
index bd5f28237c..19e31ef1b2 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_MQTREE_VERSION = 1.0.5
+ERLANG_P1_MQTREE_VERSION = 1.0.10
 ERLANG_P1_MQTREE_SITE = $(call github,processone,mqtree,$(ERLANG_P1_MQTREE_VERSION))
 ERLANG_P1_MQTREE_LICENSE = Apache-2.0
 ERLANG_P1_MQTREE_LICENSE_FILES = LICENSE
-- 
2.25.1
