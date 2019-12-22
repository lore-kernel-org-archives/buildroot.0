From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:08:12 +0100
Subject: [Buildroot] [git commit] package/python-dpkt: update the upstream
 URL in Config.in
Message-ID: <20191222215908.838348DA8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc37106579b5a1a5f5e53098ddff0c72cb597d1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
