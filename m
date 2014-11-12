From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 12 Nov 2014 21:50:12 +0100
Subject: [Buildroot] [PATCH 2/4] libevdev: add hash
In-Reply-To: <1415825414-18756-1-git-send-email-ps.report@gmx.net>
References: <1415825414-18756-1-git-send-email-ps.report@gmx.net>
Message-ID: <1415825414-18756-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libevdev/libevdev.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libevdev/libevdev.hash

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
new file mode 100644
index 0000000..28cc1ec
--- /dev/null
+++ b/package/libevdev/libevdev.hash
@@ -0,0 +1,2 @@
+# Hash from http://lists.freedesktop.org/archives/input-tools/2014-September/001112.html
+sha256 265411ce79a592b3074e9d07fb97d462745d0c7ef178254a6f720245ed253446 libevdev-1.3.tar.xz
-- 
1.8.1.4
