From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 12:14:40 +0200
Subject: [Buildroot] [git commit] package/libcoap: indentation cleanup
Message-ID: <20160702101617.0EF2F81972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a9fc5fa21d83b408d276541e505dd59ffa123b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcoap/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
index 7aea348..c089b55 100644
--- a/package/libcoap/Config.in
+++ b/package/libcoap/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBCOAP
 	bool "libcoap"
 	help
-	 libcoap is a C implementation of a lightweight application-protocol
-	 for devices that are constrained their resources such as computing
-	 power, RF range, memory, bandwith, or network packet sizes. This
-	 protocol, CoAP, is standardized by the IETF as RFC 7252. For further
-	 information related to CoAP, see <http://coap.technology>.
+	  libcoap is a C implementation of a lightweight application-protocol
+	  for devices that are constrained their resources such as computing
+	  power, RF range, memory, bandwith, or network packet sizes. This
+	  protocol, CoAP, is standardized by the IETF as RFC 7252. For further
+	  information related to CoAP, see <http://coap.technology>.
 
-	 https://github.com/obgm/libcoap
+	  https://github.com/obgm/libcoap
