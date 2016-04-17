From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 10:56:57 +0200
Subject: [Buildroot] [git commit] gadgetfs-test: add a hash file
Message-ID: <20160417085733.733AA801AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c977b2cc9d55db6768159000a0424e34e00dc496
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gadgetfs-test/gadgetfs-test.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gadgetfs-test/gadgetfs-test.hash b/package/gadgetfs-test/gadgetfs-test.hash
new file mode 100644
index 0000000..b96190a
--- /dev/null
+++ b/package/gadgetfs-test/gadgetfs-test.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bd8ebcf7ce86f4b022a4e7ba6b1cc16ffc4022bb58c1910fe4ac96c88217e7ec gadgetfs-test.tar.bz2
