From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:00:45 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add Romain Naour for toolchain
 topic
Message-ID: <20200215105640.BC77A8E0BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=579f26faa5e70f106d1c1e2d9a3c8784f6faf394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The first time I worked on the Buildroot's toolchain infra
was to add support for the Sourcery Codebench Standard
(licenced) edition toolchain (from Mentor Graphics) for
x86 target [1]. The series was rejected though.

But the knowledge gained from this work served to refactor
the toolchain-external infra in Buildroot [2].

Nowadays, I'm using toolchains-builder project to do
some toolchain build testing to keep GNU tools up to date
in Buildroot.

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112036.html
[2] http://lists.busybox.net/pipermail/buildroot/2016-October/175433.html
[3] https://gitlab.com/kubu93/toolchains-builder/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f67a85d55..e4a3bcb24a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2163,9 +2163,7 @@ F:	package/waffle/
 F:	package/xenomai/
 F:	package/zziplib/
 F:	support/testing/tests/package/test_glxinfo.py
-F:	toolchain/toolchain-external/toolchain-external-arm-aarch64/
-F:	toolchain/toolchain-external/toolchain-external-arm-aarch64-be/
-F:	toolchain/toolchain-external/toolchain-external-arm-arm/
+F:	toolchain/
 
 N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
 F:	package/davfs2/
