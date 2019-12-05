From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:44:52 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/matchbox-keyboard: add an upstream URL to Config.in
Message-ID: <20191205213859.3620C83BAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5bd55132b772fd564b509a86627c9abdc48707f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 381fb14bbd95c68c911065bb20c735cd9cb947ca)
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
