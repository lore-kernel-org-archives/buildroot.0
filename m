From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:00:48 +0100
Subject: [Buildroot] [git commit] package/gr-osmosdr: add an upstream URL to
 Config.in
Message-ID: <20191126210245.385EE8152E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08307bdc08a9f63d854af9da6f5840f466107758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gr-osmosdr/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index aa6ef0d4c2..f26380371f 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_GR_OSMOSDR
 	help
 	  GNU Radio block for interfacing with various radio hardware
 
+	  http://osmocom.org/projects/osmosdr
+
 if BR2_PACKAGE_GR_OSMOSDR
 
 config BR2_PACKAGE_GR_OSMOSDR_PYTHON
