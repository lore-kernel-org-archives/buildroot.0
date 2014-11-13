From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 13 Nov 2014 23:24:38 +0100
Subject: [Buildroot] [PATCH v2 4/4] evemu: add hash
In-Reply-To: <1415917478-24273-1-git-send-email-ps.report@gmx.net>
References: <1415917478-24273-1-git-send-email-ps.report@gmx.net>
Message-ID: <1415917478-24273-4-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes
---
 package/evemu/evemu.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/evemu/evemu.hash

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
new file mode 100644
index 0000000..2dbe47f
--- /dev/null
+++ b/package/evemu/evemu.hash
@@ -0,0 +1,2 @@
+# Hash from http://lists.freedesktop.org/archives/input-tools/2014-November/001122.html
+sha256 9e66122fbb97ad8615eda629a823e08114761e9f6ff963d0f55b9e6e47832e58 evemu-2.1.0.tar.xz
-- 
1.8.1.4
