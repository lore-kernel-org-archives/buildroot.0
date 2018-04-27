From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Apr 2018 22:29:26 +0200
Subject: [Buildroot] [git commit] vde2: add hashes for license files
Message-ID: <20180427202946.2CBD788EAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=800fb99f2702b1205f541afb9359593d8246c913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vde2/vde2.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vde2/vde2.hash b/package/vde2/vde2.hash
index a56a1bbbe0..a9e1ea2263 100644
--- a/package/vde2/vde2.hash
+++ b/package/vde2/vde2.hash
@@ -1,2 +1,5 @@
 # Locally computed:
 sha256  cbea9b7e03097f87a6b5e98b07890d2275848f1fe4b9fcda77b8994148bc9542  vde2-2.3.2.tar.bz2
+sha256  fb295d0c24b8ef4b39017ac68e772e8e6e839612ce10da12b9f48d1e8e512e2e  COPYING
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.libvdeplug
+sha256  d5ac74315b2d2f9c53f5839e311484f4646a9401b68d02d36f3dab386352e74d  COPYING.slirpvde
