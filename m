From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:55 +0100
Subject: [Buildroot] [PATCH 12/18] package/erlang-p1-pkix: bump version to
 1.0.6
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-12-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-pkix/erlang-p1-pkix.hash | 4 ++--
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index b11340b873..b0ee7d58ba 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 184069d9055991cb8b7bd07dde8737a0a793e66e1ec1020deb680f83260a3e82 erlang-p1-pkix-1.0.4.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  3a39c4ca74f93efa0e4de4c37f9e4d073b1aeb142ad669f12588ad2b3c39724e  erlang-p1-pkix-1.0.6.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
index 9f902d44bb..12ae042138 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.mk
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_PKIX_VERSION = 1.0.4
+ERLANG_P1_PKIX_VERSION = 1.0.6
 ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
 ERLANG_P1_PKIX_LICENSE = Apache-2.0
 ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
-- 
2.25.1
