From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:39:38 +0200
Subject: [Buildroot] [git commit] flann: add hash file
Message-ID: <20160524153957.C24BF81F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce5f50fdd8197b6ad9ed98c6ad2d0ae848c532a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flann is fetched from Github, so we can add a hash file for this
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flann/flann.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/flann/flann.hash b/package/flann/flann.hash
new file mode 100644
index 0000000..08242eb
--- /dev/null
+++ b/package/flann/flann.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3fec86866987c792c3fce7ecc8ba9d09a003f5d2d1a1ad94864550aad73a5c0b  flann-3645f0c30a47267e56e5acdecfc7bac2b76bc3d5.tar.gz
