From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:00:07 +0200
Subject: [Buildroot] [git commit branch/next] package/libuv: bump version to
	1.13.1
Message-ID: <20170809221936.590EB803EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dc630cd4746ba36b760299e635b71d6ec21a672
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index c8289cd..f9fe4fe 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  41ce914a88da21d3b07a76023beca57576ca5b376c6ac440c80bc581cbca1250  libuv-v1.12.0.tar.gz
+sha256 6a4976887594ec9f4e8521c95598dbbc478c59733056a5cf46354e93a1bc8400  libuv-v1.13.1.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 891ac74..06c5520 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.12.0
+LIBUV_VERSION = v1.13.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
