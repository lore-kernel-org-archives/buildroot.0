From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 17 Dec 2019 13:51:21 +0000
Subject: [Buildroot] [PATCH 1/1] package/python-pypcap: update the upstream
 URL in Config.in
Message-ID: <20191217135121.24464-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/python-pypcap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pypcap/Config.in b/package/python-pypcap/Config.in
index 9b71575c0b..9b410ecc2b 100644
--- a/package/python-pypcap/Config.in
+++ b/package/python-pypcap/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_PYPCAP
 	  The pypcap module is an object-oriented wrapper of the C
 	  libpcap library.
 
-	  https://code.google.com/p/pypcap/
+	  https://github.com/dugsong/pypcap
-- 
2.20.1
