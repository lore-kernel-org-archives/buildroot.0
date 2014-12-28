From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sun, 28 Dec 2014 22:17:25 +0100
Subject: [Buildroot] [PATCH] openocd: add hash file
In-Reply-To: <20141228173148.5b1332bb@free-electrons.com>
References: <20141228173148.5b1332bb@free-electrons.com>
Message-ID: <1419801445-1405-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Claudio Laurita <claudio.laurita@integrazionetotale.it>
---
 package/openocd/openocd.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/openocd/openocd.hash

diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
new file mode 100644
index 0000000..bc5c8c0
--- /dev/null
+++ b/package/openocd/openocd.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/openocd/files/openocd/0.8.0/
+sha1 10bf9eeb54e03083cb1a101785b2d69fbdf18f31 openocd-0.8.0.tar.bz2
+md5 6d83c34763a5f1d1ac7ad83c5a11f4fb openocd-0.8.0.tar.bz2
-- 
2.1.4
