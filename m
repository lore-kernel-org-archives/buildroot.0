From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:58:05 +0200
Subject: [Buildroot] [git commit] package/xxhash: fix hash of xxhsum.c
Message-ID: <20190928200256.E4C25821B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a07dd0e0f596d90e485fd6c7d42b71b36833a005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/feb48275dc90f599b5e6d5e09651eaa5a86a5806

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xxhash/xxhash.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 6483830088..c36156b11e 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,4 @@
 # locally computed
 sha256  afa29766cfc0448ff4a1fd9f2c47e02c48d50be5b79749925d15d545008c3f81  xxhash-0.7.1.tar.gz
 sha256  86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  LICENSE
-sha256  61252c850db00893559fa1d23bb2e77d70f2912de1aa62df661c32f42411efdc  xxhsum.c
+sha256  fd824b4aeb8dfe48a89d43bb844e4c1a9b3140e884e0fe47fb7534505d113afe  xxhsum.c
