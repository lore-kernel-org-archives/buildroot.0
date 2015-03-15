From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:13:50 +0100
Subject: [Buildroot] [git commit] bluez_utils: Add hash file
Message-ID: <20150315131423.8DBE9805EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b171d8cf279f2c3acd8e73ed27eaa0466701a6f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/bluez_utils.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bluez_utils/bluez_utils.hash b/package/bluez_utils/bluez_utils.hash
new file mode 100644
index 0000000..09b7b21
--- /dev/null
+++ b/package/bluez_utils/bluez_utils.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
+sha256	41f9578bef39b8c94a2d6ddeaa556afd22d136936d0f03100e422fe970a45a7d  bluez-4.101.tar.xz
