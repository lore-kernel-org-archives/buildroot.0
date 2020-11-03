From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 20:09:02 +0100
Subject: [Buildroot] [git commit] package/collectd: add comment about ssl
 support in rabbitmq-c
Message-ID: <20201103185702.B1CE881569@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea8e2d9d9388bb84c7eef7e36d7cc8faf9142fda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 39ecbcfe54..7037a8b383 100644
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
