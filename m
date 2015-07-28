From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:18 -0300
Subject: [Buildroot] [PATCH 077/113] php-zmq: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-77-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php-zmq/php-zmq.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/php-zmq/php-zmq.hash

diff --git a/package/php-zmq/php-zmq.hash b/package/php-zmq/php-zmq.hash
new file mode 100644
index 0000000..50ce639
--- /dev/null
+++ b/package/php-zmq/php-zmq.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c9b0af56826fc5e1a95a0fef25e671d9839a421d79e174931faacd8bee389f31	zmq-1.1.2.tgz
-- 
2.3.6
