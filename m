From: Mark Corbin <mark@dibsco.co.uk>
Date: Sun, 10 May 2020 16:43:46 +0100
Subject: [Buildroot] [PATCH v2 2/3] support/config-fragments: add RISC-V
 64-bit uclibc autobuild config
In-Reply-To: <20200510154347.5711-1-mark@dibsco.co.uk>
References: <20200510154347.5711-1-mark@dibsco.co.uk>
Message-ID: <20200510154347.5711-2-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a RISC-V 64-bit autobuild configuration for the internal
toolchain with uclibc.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
Changes v1 -> v2:
  - acknowledge that this only adds a uclibc autobuilder configuration
    and not a generic one (Thomas P)
---
 .../config-fragments/autobuild/br-riscv64-full-internal.config  | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-riscv64-full-internal.config

diff --git a/support/config-fragments/autobuild/br-riscv64-full-internal.config b/support/config-fragments/autobuild/br-riscv64-full-internal.config
new file mode 100644
index 0000000000..c729eb55e9
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv64-full-internal.config
@@ -0,0 +1,2 @@
+BR2_riscv=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.20.1
