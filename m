From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:54:20 +0200
Subject: [Buildroot] [git commit] package/mxs-bootlets: add hash file
Message-ID: <20160619200325.48B2281794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3222a10869d11d07e1d3598c4c469a588c847cbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/mxs-bootlets/mxs-bootlets.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/mxs-bootlets/mxs-bootlets.hash b/boot/mxs-bootlets/mxs-bootlets.hash
new file mode 100644
index 0000000..6d3483c
--- /dev/null
+++ b/boot/mxs-bootlets/mxs-bootlets.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  63f6068ae36884adef4259bbb1fe2591755718f22c46d0a59d854883dfab1ffc  imx-bootlets-src-10.12.01.tar.gz
