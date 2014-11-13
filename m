From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 13 Nov 2014 23:24:36 +0100
Subject: [Buildroot] [PATCH v2 2/4] libevdev: add hash
In-Reply-To: <1415917478-24273-1-git-send-email-ps.report@gmx.net>
References: <1415917478-24273-1-git-send-email-ps.report@gmx.net>
Message-ID: <1415917478-24273-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
    Changes v1 -> v2:
      - change hash for new version 1.3.1
---
 package/libevdev/libevdev.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libevdev/libevdev.hash

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
new file mode 100644
index 0000000..b53a4ce
--- /dev/null
+++ b/package/libevdev/libevdev.hash
@@ -0,0 +1,2 @@
+# Hash from http://lists.freedesktop.org/archives/input-tools/2014-November/001123.html
+sha256 4b7c76195f0087023142f26c5fd2c254b35c861880c6902d3dd9b27daeec2643 libevdev-1.3.1.tar.xz
-- 
1.8.1.4
