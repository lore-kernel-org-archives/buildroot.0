From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jul 2015 10:36:50 +0300
Subject: [Buildroot] [PATCH] lxc: add hash file
Message-ID: <4c4438030b09b3e82d18d44f721de927bd7fbb5f.1437032210.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lxc/lxc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lxc/lxc.hash

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
new file mode 100644
index 000000000000..dcc532c0e8ae
--- /dev/null
+++ b/package/lxc/lxc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256 34ba517ffd7b38a14e5d12d56a4928b78602d56311d5f47c3ef90f4e714b9604 lxc-1.1.2.tar.gz
-- 
2.1.4
