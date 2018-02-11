From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Feb 2018 17:58:21 +0100
Subject: [Buildroot] [PATCH 3/6] cargo-bin: use RUSTC_{HOST,TARGET}_NAME
In-Reply-To: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
References: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180211165824.20213-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo-bin/cargo-bin.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 0f235748ff..3c834d9033 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -6,7 +6,7 @@
 
 CARGO_BIN_VERSION = 0.24.0
 CARGO_BIN_SITE = https://static.rust-lang.org/dist
-CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUST_HOST_NAME).tar.xz
+CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
 CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
-- 
2.14.3
