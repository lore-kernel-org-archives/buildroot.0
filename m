From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Nov 2020 18:17:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: add comment about ssl
 support in rabbitmq-c
Message-ID: <20201103171735.22512-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index d54d64ca9c..3e854ba518 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -582,7 +582,7 @@ comment "Select at least one for collectd to be useful"
 
 config BR2_PACKAGE_COLLECTD_AMQP
 	bool "amqp"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL # needs rabbitmq-c with ssl support
 	select BR2_PACKAGE_RABBITMQ_C
 	help
 	  Send/receive values via the Advanced Message Queuing Protocol
-- 
2.28.0
