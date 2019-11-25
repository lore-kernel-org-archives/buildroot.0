From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:51:49 +0100
Subject: [Buildroot] [git commit] package/bcg729: update the upstream URL in
 Config.in
Message-ID: <20191125204401.56CE78354B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=674a215ecc1b6e5b0ac56233a69f34e4926934a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
