From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 22:46:59 +0100
Subject: [Buildroot] [git commit branch/next] support/config-fragments:
 remove bogus BR2_JLEVEL option
Message-ID: <20180205214818.86C2C872BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14fdb63804f1548b5d1ab9598100c7f103d4512d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There is no reason to have a BR2_JLEVEL option in such toolchain
defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-xtensa-full-internal.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/config-fragments/autobuild/br-xtensa-full-internal.config b/support/config-fragments/autobuild/br-xtensa-full-internal.config
index f642a4d76b..89e81d4c45 100644
--- a/support/config-fragments/autobuild/br-xtensa-full-internal.config
+++ b/support/config-fragments/autobuild/br-xtensa-full-internal.config
@@ -1,4 +1,3 @@
 BR2_xtensa=y
-BR2_JLEVEL=8
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
