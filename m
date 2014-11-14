From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 14 Nov 2014 19:31:13 +0100
Subject: [Buildroot] [PATCH v3 2/4] libevdev: add hash
In-Reply-To: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
References: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
Message-ID: <1415989875-22535-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
  - add reviewed-by and tested-by, see [1]

Changes v1 -> v2:
  - change hash for new version 1.3.1

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112086.html
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
