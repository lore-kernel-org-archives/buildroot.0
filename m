From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 17 Apr 2016 02:20:33 +0200
Subject: [Buildroot] [PATCH 2/2] gadgetfs-test: add a hash file
In-Reply-To: <1460852433-29840-1-git-send-email-fabio.porcedda@gmail.com>
References: <1460852433-29840-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1460852433-29840-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/gadgetfs-test/gadgetfs-test.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gadgetfs-test/gadgetfs-test.hash

diff --git a/package/gadgetfs-test/gadgetfs-test.hash b/package/gadgetfs-test/gadgetfs-test.hash
new file mode 100644
index 0000000..b96190a
--- /dev/null
+++ b/package/gadgetfs-test/gadgetfs-test.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bd8ebcf7ce86f4b022a4e7ba6b1cc16ffc4022bb58c1910fe4ac96c88217e7ec gadgetfs-test.tar.bz2
-- 
2.8.1
