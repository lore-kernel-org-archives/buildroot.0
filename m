From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Nov 2016 14:39:14 +0000
Subject: [Buildroot] [PATCH next 6/6] libatomic_ops: bump version to 7.4.4
In-Reply-To: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
Message-ID: <20161123143914.3969-6-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index d91f705..47a281d 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2616be0a2f70f7e3eb12f131a36e32723ed5a1928f17b886c3e7c62f7ed14339  libatomic_ops-libatomic_ops-7_4_2.tar.gz
+sha256 ef8335676f18a111f885d48810ab090fb6bfad94e5a5dd76cdccd2a536828662  libatomic_ops-libatomic_ops-7_4_4.tar.gz
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index fd45726..b5e2172 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_2
+LIBATOMIC_OPS_VERSION = libatomic_ops-7_4_4
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
-- 
2.10.1
