From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:36:03 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/setserial: add an
 upstream URL to Config.in
Message-ID: <20191225214909.5E7C38E522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bce5710abb40c4813a37694ca221fc640fde05e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3e581829e98cdf0b1f71ddb19e715c8281aee26e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/setserial/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setserial/Config.in b/package/setserial/Config.in
index 4ff2477e84..1182cb063b 100644
--- a/package/setserial/Config.in
+++ b/package/setserial/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_SETSERIAL
 	depends on BR2_USE_MMU
 	help
 	  Setserial : configuration of serial ports
+
+	  http://setserial.sourceforge.net/
