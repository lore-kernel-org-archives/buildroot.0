From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:15 -0300
Subject: [Buildroot] [PATCH 074/113] php-memcached: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-74-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-memcached/php-memcached.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/php-memcached/php-memcached.hash

diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
new file mode 100644
index 0000000..bc2e97a
--- /dev/null
+++ b/package/php-memcached/php-memcached.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	17b9600f6d4c807f23a3f5c45fcd8775ca2e61d6eda70370af2bef4c6e159f58	memcached-2.2.0.tgz
-- 
2.3.6
