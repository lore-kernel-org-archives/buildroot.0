From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 23:32:19 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: rename
 br-riscv64-musl config
Message-ID: <20190802213127.7D01789007@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5893254055610e416316803de0095b0ce6f03f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For internal toolchains, we have a policy of naming the files with
"internal", to clearly distinguish them from external toolchain
configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../autobuild/{br-riscv64-musl.config => br-riscv64-internal-musl.config} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/support/config-fragments/autobuild/br-riscv64-musl.config b/support/config-fragments/autobuild/br-riscv64-internal-musl.config
similarity index 100%
rename from support/config-fragments/autobuild/br-riscv64-musl.config
rename to support/config-fragments/autobuild/br-riscv64-internal-musl.config
