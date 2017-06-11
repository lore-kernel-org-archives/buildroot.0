From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:25 +0200
Subject: [Buildroot] [PATCH 16/28] package/mmc-utils: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mmc-utils/mmc-utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mmc-utils/mmc-utils.hash

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
new file mode 100644
index 000000000..a429079ba
--- /dev/null
+++ b/package/mmc-utils/mmc-utils.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4e5018e70f134b8c7ed05c84fca4b29fdce2ef2ca5abc0b9765939e6d8c3d912  mmc-utils-2cb6695e8dec00d887bdd5309d1b57d836fcd214.tar.gz
-- 
2.11.0
