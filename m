From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:24:37 -0300
Subject: [Buildroot] [PATCH 1/4] tftpd: add hash file
Message-ID: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tftpd/tftpd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tftpd/tftpd.hash

diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
new file mode 100644
index 0000000..247b757
--- /dev/null
+++ b/package/tftpd/tftpd.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/tftp/tftp-hpa/sha256sums.asc
+sha256	afee361df96a2f88344e191f6a25480fd714e1d28d176c3f10cc43fa206b718b	tftp-hpa-5.2.tar.xz
-- 
2.0.4
