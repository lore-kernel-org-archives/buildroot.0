From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Mar 2015 09:41:15 +0100
Subject: [Buildroot] [PATCH 5/5] ncmpc: add hash file
In-Reply-To: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1425372075-22985-5-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ncmpc/ncmpc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ncmpc/ncmpc.hash

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
new file mode 100644
index 0000000..1acc64d
--- /dev/null
+++ b/package/ncmpc/ncmpc.hash
@@ -0,0 +1,2 @@
+# Calculated locally
+sha256 0e6f76b2b11449cfa479d2830ac681f4e3bff54a95a9134b069dd5a173b4c3e9 ncmpc-0.24.tar.xz
-- 
1.9.1
