From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:55:23 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/glibc/riscv32:
 update LICENSE file hash
Message-ID: <20200307204447.BC5DB8FC26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c14f8f3bcc6d27d228959d6efac2403bcfdf8648
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The LICENSE file hash wasn't changed with the last glibc bump for riscv32 [1].
The change is due to upstream LICENSE file update between glibc 2.26 and 2.29
[2] [3].

This issue was discovered by toolchain-builder [4].

[1] a4958567284026f979f6e0056a5b98bedd77e88f
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=7f9f1ecb710eac4d65bb02785ddf288cac098323
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=5a357506659f9a00fcf5bc9c5d8fc676175c89a7
[4] https://gitlab.com/kubu93/toolchains-builder/-/jobs/423826546

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 76d1629e5755b0c9102bcdea18669a4e7bd48351)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
index 09ddc7be72..ce378c0bd1 100644
--- a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
+++ b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
@@ -4,4 +4,4 @@ sha256 703877c0df77fce00719fe55cc62b07bb8d5f44fdb704bbb1b0bf2cf38afe10a  glibc-0
 # Hashes for license files
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
-sha256 61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431 LICENSES
+sha256 35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f LICENSES
