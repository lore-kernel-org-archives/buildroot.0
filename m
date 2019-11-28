From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:00:54 +0000
Subject: [Buildroot] [PATCH 3/7] package/matchbox-fakekey: add an upstream
 URL to Config.in
In-Reply-To: <20191128160058.24118-1-mark@dibsco.co.uk>
References: <20191128160058.24118-1-mark@dibsco.co.uk>
Message-ID: <20191128160058.24118-3-mark@dibsco.co.uk>
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
 package/matchbox-fakekey/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-fakekey/Config.in b/package/matchbox-fakekey/Config.in
index 1a1f1341ec..0a8f628182 100644
--- a/package/matchbox-fakekey/Config.in
+++ b/package/matchbox-fakekey/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_MATCHBOX_FAKEKEY
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  Library for simulating key press events under X11.
+
+	  http://git.yoctoproject.org/cgit/cgit.cgi/libfakekey/
-- 
2.20.1
