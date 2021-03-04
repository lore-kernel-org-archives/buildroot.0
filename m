From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:35:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-server: add CPE variables
Message-ID: <20210304113541.1236451-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pivotal_software:rabbitmq is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apivotal_software%3Arabbitmq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rabbitmq-server/rabbitmq-server.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index 26c2fae5ec..c5d3190de9 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -32,6 +32,8 @@ RABBITMQ_SERVER_LICENSE_FILES = \
 	LICENSE-MPL-RabbitMQ \
 	LICENSE-MPL2 \
 	LICENSE-rabbitmq_aws
+RABBITMQ_SERVER_CPE_ID_VENDOR = pivotal_software
+RABBITMQ_SERVER_CPE_ID_PRODUCT = rabbitmq
 
 RABBITMQ_SERVER_DEPENDENCIES = host-elixir host-libxslt host-zip erlang libxslt
 RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
-- 
2.30.0
