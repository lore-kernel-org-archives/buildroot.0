From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:16 -0300
Subject: [Buildroot] [PATCH 075/113] php-ssh2: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-75-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-ssh2/php-ssh2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/php-ssh2/php-ssh2.hash

diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
new file mode 100644
index 0000000..d599662
--- /dev/null
+++ b/package/php-ssh2/php-ssh2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	600c82d2393acf3642f19914f06a7afea57ee05cb8c10e8a5510b32188b97f99	ssh2-0.12.tgz
-- 
2.3.6
