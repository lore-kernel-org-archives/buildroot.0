From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Aug 2016 23:39:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/kismet: add hash file
Message-ID: <1471642793-12953-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/kismet/kismet.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/kismet/kismet.hash

diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
new file mode 100644
index 0000000..e4dc5a4
--- /dev/null
+++ b/package/kismet/kismet.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 23b693baa29549b051e95e9d597b115bd94f7267c4677307ebd87f2a00e5a52b kismet-Kismet-2014-02-R1.tar.gz
-- 
2.5.5
