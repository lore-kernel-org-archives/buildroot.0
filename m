From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:44:08 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/linux-fusion: add
 an upstream URL to Config.in
Message-ID: <20191205213908.8A84E80F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96015cd5e56e459559c8499af534369864b23585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dcc2a29f410728e485bfce739a63101ead5cce71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-fusion/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
index ed8bd6ad48..14b4f946af 100644
--- a/package/linux-fusion/Config.in
+++ b/package/linux-fusion/Config.in
@@ -8,3 +8,5 @@ config BR2_PACKAGE_LINUX_FUSION
 	help
 	  DirectFB Communication Layer allowing multiple DirectFB
 	  applications to run concurrently
+
+	  https://github.com/deniskropp/linux-fusion
