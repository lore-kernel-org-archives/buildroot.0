From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 25 Aug 2015 11:45:24 +0200
Subject: [Buildroot] [PATCH 1/1] erlang-p1-tls: add missing dependency to
	openssl
Message-ID: <1440495924-18788-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
index 42c6a3e..0df3348 100644
--- a/package/erlang-p1-tls/Config.in
+++ b/package/erlang-p1-tls/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG_P1_TLS
 	bool "erlang-p1-tls"
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Erlang interface to OpenSSL
 
-- 
2.1.4
