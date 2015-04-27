From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Apr 2015 12:35:52 +0300
Subject: [Buildroot] [PATCH 1/2] memtester: add hash
Message-ID: <618ca12806107797707e4aff6e80a6253aef04c7.1430127353.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/memtester/memtester.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/memtester/memtester.hash

diff --git a/package/memtester/memtester.hash b/package/memtester/memtester.hash
new file mode 100644
index 000000000000..2d9ef3977fe2
--- /dev/null
+++ b/package/memtester/memtester.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88	memtester-4.3.0.tar.gz
-- 
2.1.4
