From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Aug 2019 22:51:46 +0200
Subject: [Buildroot] [PATCH 1/3] support/config-fragments/autobuild: rename
 br-riscv64-musl config
Message-ID: <20190802205149.28342-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For internal toolchains, we have a policy of naming the files with
"internal", to clearly distinguish them from external toolchain
configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../{br-riscv64-musl.config => br-riscv64-internal-musl.config}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename support/config-fragments/autobuild/{br-riscv64-musl.config => br-riscv64-internal-musl.config} (100%)

diff --git a/support/config-fragments/autobuild/br-riscv64-musl.config b/support/config-fragments/autobuild/br-riscv64-internal-musl.config
similarity index 100%
rename from support/config-fragments/autobuild/br-riscv64-musl.config
rename to support/config-fragments/autobuild/br-riscv64-internal-musl.config
-- 
2.21.0
