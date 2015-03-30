From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 30 Mar 2015 22:54:05 +0200
Subject: [Buildroot] [PATCH v2] logrotate: add hash file
Message-ID: <1427748845-10587-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
---
 package/logrotate/logrotate.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/logrotate/logrotate.hash

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
new file mode 100644
index 0000000..ef537a9
--- /dev/null
+++ b/package/logrotate/logrotate.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 700ed7ce9072a1cca324779a74797dfaefdae37ac50a817134b947c4ded1dfa7 logrotate-3.8.9.tar.gz
-- 
2.1.0
