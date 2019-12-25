From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:42:19 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/python-dpkt:
 update the upstream URL in Config.in
Message-ID: <20191225214909.AB9058E474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d079bbbcdfaa90dcaf190d5167f53d6497fdfdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc37106579b5a1a5f5e53098ddff0c72cb597d1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dpkt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
index f1e4ddff15..d8e3388d7e 100644
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_DPKT
 	  Fast, simple packet creation / parsing, with definitions
 	  for the basic TCP/IP protocols.
 
-	  http://code.google.com/p/dpkt/
+	  https://github.com/kbandla/dpkt
