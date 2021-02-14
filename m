From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 16:24:55 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/sox: use
 old-format tarball hash
Message-ID: <20210214150639.B566D83A03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a40753e50cb1a4ebe3ee562ba51a774f621a9d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
http://autobuild.buildroot.net/results/8185a765ba246f51e8b24b5bf2058b25b9b0c05c/
http://autobuild.buildroot.net/results/50fdcb3cff40249c2656caf3eb627b2e68a76a87/

Commit 6406e08e4e25dd (package/sox: security bump to latest git commit)
bumped the version of sox to a recent git hash, but added the tarball hash
using the new "br1" format, which has only been added post-2020.11.

Add the old-format hash to fix the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sox/sox.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sox/sox.hash b/package/sox/sox.hash
index d2006e0291..719a7ca982 100644
--- a/package/sox/sox.hash
+++ b/package/sox/sox.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3d06ba8fc39ac92f16da73593be48afe0a704fe4dc4f6eca2e5137ef77cd5115  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e-br1.tar.gz
+sha256  ece6f43bcf3eafde29024087597a1aa3a346e77cef64f01497f167512e62e0ef  sox-7524160b29a476f7e87bc14fddf12d349f9a3c5e.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  LICENSE.LGPL
