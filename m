From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 Jan 2018 23:54:06 +0100
Subject: [Buildroot] [PATCH] support/config-fragments: linaro-aarch64:
 remove default option
In-Reply-To: <20180109225407.24501-1-romain.naour@gmail.com>
References: <20180109225407.24501-1-romain.naour@gmail.com>
Message-ID: <20180109225407.24501-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64 which is used by
default when a aarch64 CPU is used.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/config-fragments/autobuild/linaro-aarch64.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/config-fragments/autobuild/linaro-aarch64.config b/support/config-fragments/autobuild/linaro-aarch64.config
index f65f78a39b..bb466f384b 100644
--- a/support/config-fragments/autobuild/linaro-aarch64.config
+++ b/support/config-fragments/autobuild/linaro-aarch64.config
@@ -1,3 +1,2 @@
 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
-- 
2.14.3
