From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 15:38:02 -0300
Subject: [Buildroot] [PATCH] nginx: add hash file
Message-ID: <1426703882-31940-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nginx/nginx.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nginx/nginx.hash

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
new file mode 100644
index 0000000..96e5fb2
--- /dev/null
+++ b/package/nginx/nginx.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18	nginx-1.6.2.tar.gz
-- 
2.0.5
