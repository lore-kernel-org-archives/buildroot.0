From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 16:12:08 +0000
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add an upstream URL to
 Config.in
Message-ID: <20191126161208.4152-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
