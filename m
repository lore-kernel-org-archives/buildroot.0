From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:29:29 +0200
Subject: [Buildroot] [git commit] package/libyuv: add hash
Message-ID: <20170611123754.2F38F7F94F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06624bec4ce5ef1c1f9fab6a27c622583beea76f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libyuv/libyuv.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libyuv/libyuv.hash b/package/libyuv/libyuv.hash
new file mode 100644
index 0000000..0361ce6
--- /dev/null
+++ b/package/libyuv/libyuv.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 ec31df87fc42153723e9ca65a6d71b0993504c3de5f925e79464c93b7ef66094  libyuv-1ebf86795cb213a37f06eb1ef3713cff080568ea.tar.gz
