From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:12:01 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/bcg729: update
 the upstream URL in Config.in
Message-ID: <20191203130351.3CF7B83FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e719241e487672229e053f70fdc0995f37db08c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 674a215ecc1b6e5b0ac56233a69f34e4926934a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
