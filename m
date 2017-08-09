From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:56:25 +0200
Subject: [Buildroot] [git commit branch/next] package/libatomic_ops: bump
	version to 7.4.6
Message-ID: <20170809221935.EC0227F945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e661afd27c8edebe42246e14614cb0299ec835c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 47a281d..9e67624 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ef8335676f18a111f885d48810ab090fb6bfad94e5a5dd76cdccd2a536828662  libatomic_ops-libatomic_ops-7_4_4.tar.gz
+sha256 cf7e61f7f929651b65d6186a03446819805c867f4f75c7148c8f26321eb66260  libatomic_ops-v7.4.6.tar.gz
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 52d2745..483f118 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_4
+LIBATOMIC_OPS_VERSION = v7.4.6
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
