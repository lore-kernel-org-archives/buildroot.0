From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 18:21:34 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] support/config-fragments:
 remove bogus BR2_JLEVEL option
Message-ID: <20180330193200.7E9A983A0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07a9d75ec14c03805d8ba5ba21d6835818f3e801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

There is no reason to have a BR2_JLEVEL option in such toolchain
defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14fdb63804f1548b5d1ab9598100c7f103d4512d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
