From: Mark Corbin <mark@dibsco.co.uk>
Date: Mon, 25 Nov 2019 20:24:39 +0000
Subject: [Buildroot] [PATCH 1/1] package/bcg729: update the upstream URL in
 Config.in
Message-ID: <20191125202439.19121-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/bcg729/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bcg729/Config.in b/package/bcg729/Config.in
index 8e9bcfe66b..cb936ae158 100644
--- a/package/bcg729/Config.in
+++ b/package/bcg729/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_BCG729
 	  Bcg729 is an opensource implementation of both encoder and
 	  decoder of the ITU G729 Annex A/B speech codec.
 
-	  http://www.linphone.org/technical-corner/bcg729/overview
+	  https://www.linphone.org/technical-corner/bcg729
-- 
2.20.1
