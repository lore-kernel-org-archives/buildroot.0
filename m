From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 27 Oct 2016 13:28:30 -0400
Subject: [Buildroot] [PATCH 1/2] rabbitmq-server: DEPENDS->DEPENDENCIES
Message-ID: <1477589311-12803-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/rabbitmq-server/rabbitmq-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index 6af62f6..4a38955 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -17,7 +17,7 @@ RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
 				LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
 				LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
 				LICENSE-MPL2
-RABBITMQ_SERVER_DEPENDS = erlang libxslt
+RABBITMQ_SERVER_DEPENDENCIES = erlang libxslt
 RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
 
 define RABBITMQ_SERVER_BUILD_CMDS
-- 
2.7.4
