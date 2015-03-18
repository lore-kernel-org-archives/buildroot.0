From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 15:49:18 -0300
Subject: [Buildroot] [PATCH] m4: add hash file
Message-ID: <1426704558-2883-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/m4/m4.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/m4/m4.hash

diff --git a/package/m4/m4.hash b/package/m4/m4.hash
new file mode 100644
index 0000000..38214dc
--- /dev/null
+++ b/package/m4/m4.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	f0543c3beb51fa6b3337d8025331591e0e18d8ec2886ed391f1aade43477d508	m4-1.4.17.tar.xz
-- 
2.0.5
