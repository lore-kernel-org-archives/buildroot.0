From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 15:47:00 -0300
Subject: [Buildroot] [PATCH] nano: add hash file
Message-ID: <1426704420-25770-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nano/nano.hash

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
new file mode 100644
index 0000000..7bc8f37
--- /dev/null
+++ b/package/nano/nano.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	a74bf3f18b12c1c777ae737c0e463152439e381aba8720b4bc67449f36a09534	nano-2.3.6.tar.gz
-- 
2.0.5
