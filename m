From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 21:53:34 +0200
Subject: [Buildroot] [git commit] rabbitmq-server: DEPENDS->DEPENDENCIES
Message-ID: <20161027195405.6155A7FC13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d0c08da2258e76439845b07740c6b2b8aabd5c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
