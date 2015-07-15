From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:09 -0300
Subject: [Buildroot] [PATCH 18/40] ngircd: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ngircd/ngircd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ngircd/ngircd.hash

diff --git a/package/ngircd/ngircd.hash b/package/ngircd/ngircd.hash
new file mode 100644
index 0000000..45e2d9e
--- /dev/null
+++ b/package/ngircd/ngircd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	93f953b2785ff0e6e29b8b3794ba5a64754b86251ce71bf39fc27f4f5074eada	ngircd-20.3.tar.xz
-- 
2.3.6
