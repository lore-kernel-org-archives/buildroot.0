From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:27:45 +0200
Subject: [Buildroot] [git commit] package/glibc: fix typo in hash file
Message-ID: <20181020182612.8965587FE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4b794923444b4925314b54a8acef607d39a0071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/glibc/arc-2018.03-release/glibc.hash:4: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
package/glibc/arc-2018.03-release/glibc.hash:4: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/arc-2018.03-release/glibc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/arc-2018.03-release/glibc.hash b/package/glibc/arc-2018.03-release/glibc.hash
index d073c9166f..f3b10d9105 100644
--- a/package/glibc/arc-2018.03-release/glibc.hash
+++ b/package/glibc/arc-2018.03-release/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from Github)
 sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de  glibc-arc-2018.03-release.tar.gz
 
-$ Hashes for license files
+# Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
 sha256  61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431  LICENSES
