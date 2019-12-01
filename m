From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 19:14:43 +0100
Subject: [Buildroot] [git commit] package/matchbox-fakekey: add an upstream
 URL to Config.in
Message-ID: <20191201180900.13DCB8347A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=680d20cd4749d56cac5e41c844dbde90c32f2e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
