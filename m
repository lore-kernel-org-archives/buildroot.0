From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Feb 2021 18:50:52 +0100
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.9.3
Message-ID: <20210206173101.DB9A181595@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc7067df246a36edb5b3991c679954fbe1d75535
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/erthink/libmdbx/releases/tag/v0.9.3

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 0d3501f1d9..fcfb4a673f 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://github.com/erthink/libmdbx/releases/
-sha256  c35cc53d66d74ebfc86e39441ba26276541ac7892bf91dba1e70c83665a02767  libmdbx-amalgamated-0.9.2.tar.gz
+sha256  d12bc7189b746beaa85514fcd1fcf26b957bb8feadb11662a0e20c4e79410d3f  libmdbx-amalgamated-0.9.3.tar.gz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 370df2eaa3..baf5193eb6 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.9.2
+LIBMDBX_VERSION = 0.9.3
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
 LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
