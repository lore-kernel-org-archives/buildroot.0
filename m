From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Oct 2014 15:08:25 +0200
Subject: [Buildroot] [git commit] tftpd: add hash file
Message-ID: <20141016060905.73DD59D858@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afb566e264a4c4b524a826937cf944b8a93d39cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/tftpd.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
new file mode 100644
index 0000000..247b757
--- /dev/null
+++ b/package/tftpd/tftpd.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/tftp/tftp-hpa/sha256sums.asc
+sha256	afee361df96a2f88344e191f6a25480fd714e1d28d176c3f10cc43fa206b718b	tftp-hpa-5.2.tar.xz
