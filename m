From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:33:33 +0200
Subject: [Buildroot] [git commit] package/quazip: fix legal info
Message-ID: <20201013112321.EA67F7FB2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b82a21e86e0911ef068f69aeaf656dd166ce7de9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (QuaZIP renamed into QuaZip since version 1.0 and
https://github.com/stachenov/quazip/commit/5bd87270bd9c0dbe99c102e5b442e1fe142166be)

While at it, update indentation (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/4a8dc1be76d9f08d44b158f39734932793348a03

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quazip/quazip.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 8fab64b453..5eff5cfb3d 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 54edce9c11371762bd4f0003c2937b5d8806a2752dd9c0fd9085e90792612ad0 quazip-1.1.tar.gz
-sha256 d2a653b46b87963f29a7f1523e7c39bafdbb3592dfa01725e61a523387148e72 COPYING
+sha256  54edce9c11371762bd4f0003c2937b5d8806a2752dd9c0fd9085e90792612ad0  quazip-1.1.tar.gz
+sha256  3aab586a5bdc8ffbbf033c7106550fd3e849fd8888e33cbc9bfd30a433c4b1cb  COPYING
