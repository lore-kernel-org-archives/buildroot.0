From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:06 -0300
Subject: [Buildroot] [PATCH 08/11] openssl: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/openssl/openssl.hash

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
new file mode 100644
index 0000000..aa45a76
--- /dev/null
+++ b/package/openssl/openssl.hash
@@ -0,0 +1,4 @@
+# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.md5
+# From https://www.openssl.org/source/openssl-1.0.1i.tar.gz.sha1
+md5	c8dc151a671b9b92ff3e4c118b174972	openssl-1.0.1i.tar.gz
+sha1	74eed314fa2c93006df8d26cd9fc630a101abd76	openssl-1.0.1i.tar.gz
-- 
1.8.5.5
