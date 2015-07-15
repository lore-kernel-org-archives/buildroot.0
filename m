From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:08 -0300
Subject: [Buildroot] [PATCH 17/40] proftpd: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/proftpd/proftpd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/proftpd/proftpd.hash

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
new file mode 100644
index 0000000..183e824
--- /dev/null
+++ b/package/proftpd/proftpd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	c198b53991ce641eae6b3237e856e59f0bfe8330794145b49cae33f85b6f5370	proftpd-1.3.4d.tar.gz
-- 
2.3.6
