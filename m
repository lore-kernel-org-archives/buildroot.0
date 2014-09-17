From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:05 -0300
Subject: [Buildroot] [PATCH 07/11] wireless-regdb: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireless-regdb/wireless-regdb.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/wireless-regdb/wireless-regdb.hash

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
new file mode 100644
index 0000000..dd9189e
--- /dev/null
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
+sha256	fbebc9217ff19a3480ec24c61bafd0ba771967d6c895845591b0d231c9ab7dc6	wireless-regdb-2014.06.13.tar.xz
-- 
1.8.5.5
