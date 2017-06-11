From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:11 +0200
Subject: [Buildroot] [PATCH 02/28] package/dtv-scan-tables: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dtv-scan-tables/dtv-scan-tables.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dtv-scan-tables/dtv-scan-tables.hash

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
new file mode 100644
index 000000000..02f086dc5
--- /dev/null
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 ec64aa81a207372340a04d3e9e950ff2f8b4f404580f21480cdbf06019057a9f  dtv-scan-tables-ceb11833b35f05813b1f0397a60e0f3b99430aab.tar.gz
-- 
2.11.0
