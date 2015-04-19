From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 15:07:18 +0200
Subject: [Buildroot] [PATCH 3/9] package/ecryptfs-utils: add hash
In-Reply-To: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429448844-12598-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ecryptfs-utils/ecryptfs-utils.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ecryptfs-utils/ecryptfs-utils.hash

diff --git a/package/ecryptfs-utils/ecryptfs-utils.hash b/package/ecryptfs-utils/ecryptfs-utils.hash
new file mode 100644
index 0000000..9dc6b99
--- /dev/null
+++ b/package/ecryptfs-utils/ecryptfs-utils.hash
@@ -0,0 +1,2 @@
+# From https://launchpad.net/ecryptfs/trunk/104/+download/ecryptfs-utils_104.orig.tar.gz/+md5
+md5	6ae93822bcf0d15470516c30a3deee32	ecryptfs-utils_104.orig.tar.gz
-- 
1.7.10.4
