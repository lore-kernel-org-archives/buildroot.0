From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:14 -0000
Subject: [Buildroot] [git commit] support/config-fragments: remove bogus
 BR2_JLEVEL option
Message-ID: <20180305200710.CC807810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14fdb63804f1548b5d1ab9598100c7f103d4512d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
