From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:14 -0300
Subject: [Buildroot] [PATCH 073/113] php-imagick: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-73-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-imagick/php-imagick.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/php-imagick/php-imagick.hash

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
new file mode 100644
index 0000000..6173eca
--- /dev/null
+++ b/package/php-imagick/php-imagick.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	528769ac304a0bbe9a248811325042188c9d16e06de16f111fee317c85a36c93	imagick-3.1.2.tgz
-- 
2.3.6
