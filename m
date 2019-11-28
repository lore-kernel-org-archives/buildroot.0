From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:00:55 +0000
Subject: [Buildroot] [PATCH 4/7] package/matchbox-keyboard: add an upstream
 URL to Config.in
In-Reply-To: <20191128160058.24118-1-mark@dibsco.co.uk>
References: <20191128160058.24118-1-mark@dibsco.co.uk>
Message-ID: <20191128160058.24118-4-mark@dibsco.co.uk>
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
 package/matchbox-keyboard/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
index 8bd2a7972c..b6753f3bec 100644
--- a/package/matchbox-keyboard/Config.in
+++ b/package/matchbox-keyboard/Config.in
@@ -6,3 +6,5 @@ config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	select BR2_PACKAGE_MATCHBOX_LIB
 	help
 	  Virtual Keyboard
+
+	  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/
-- 
2.20.1
