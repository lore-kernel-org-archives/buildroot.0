From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:46 +0100
Subject: [Buildroot] [PATCH 03/18] package/erlang-eimp: bump version to
 1.0.17
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-3-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-eimp/erlang-eimp.hash | 4 ++--
 package/erlang-eimp/erlang-eimp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
index a0276beded..28d22be16d 100644
--- a/package/erlang-eimp/erlang-eimp.hash
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 dfcdc211480f974175af615616c7f8c1e8f9dff5d6be5faa3f20c3eb4c60240e erlang-eimp-1.0.12.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
+sha256  1a529fa6e8264d3cad43861db417a1e841b28c0601aa847857fa0d6a81935922  erlang-eimp-1.0.17.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
index c8cea0e429..d066961cd3 100644
--- a/package/erlang-eimp/erlang-eimp.mk
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_EIMP_VERSION = 1.0.12
+ERLANG_EIMP_VERSION = 1.0.17
 ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
 ERLANG_EIMP_LICENSE = Apache-2.0
 ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
