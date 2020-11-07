From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Nov 2020 18:43:48 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/collectd: add
 comment about ssl support in rabbitmq-c
Message-ID: <20201107174515.4A26C86F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caa454737f95e8bfa27309a7f05fef7681e8a0a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ea8e2d9d9388bb84c7eef7e36d7cc8faf9142fda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 5e526d9e0f..15f544fd6c 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -571,7 +571,7 @@ comment "Select at least one for collectd to be useful"
 
 config BR2_PACKAGE_COLLECTD_AMQP
 	bool "amqp"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL # needs rabbitmq-c with ssl support
 	select BR2_PACKAGE_RABBITMQ_C
 	help
 	  Send/receive values via the Advanced Message Queuing Protocol
