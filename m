From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 19:14:49 +0100
Subject: [Buildroot] [git commit] package/matchbox-keyboard: add an upstream
 URL to Config.in
Message-ID: <20191201180900.1BFD68347A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=381fb14bbd95c68c911065bb20c735cd9cb947ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
