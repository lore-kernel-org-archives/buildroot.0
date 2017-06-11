From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:14 +0200
Subject: [Buildroot] [PATCH 05/28] package/flashbench: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flashbench/flashbench.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/flashbench/flashbench.hash

diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
new file mode 100644
index 000000000..a5eb388c8
--- /dev/null
+++ b/package/flashbench/flashbench.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 12e2dcb6f041ef1a303fc5bc84642ed637c24d77ed6c667a2187f21d54555731  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
-- 
2.11.0
