From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 22:54:22 +0100
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-cache-tab:
 bump version to 1.0.25
Message-ID: <20201201221509.DED978113D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe282f13bad1413afea106bba5a44047dfb62595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash | 4 ++--
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
index 605ced2ba7..85a92cf0b2 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 572b6532dca59c561d994bf2bf8eed3637118c64cdd3a9e51d81b506f5b09e2c erlang-p1-cache-tab-1.0.20.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
+sha256  32cb3a3017f53e66bd1c2b75f60a2c4a14f00f375582a3c511ea39266b2385b9  erlang-p1-cache-tab-1.0.25.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index 0d53358cfa..f3253d1cd7 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = 1.0.20
+ERLANG_P1_CACHE_TAB_VERSION = 1.0.25
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
 ERLANG_P1_CACHE_TAB_LICENSE = Apache-2.0
 ERLANG_P1_CACHE_TAB_LICENSE_FILES = LICENSE.txt
