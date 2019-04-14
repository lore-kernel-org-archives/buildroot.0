From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:13:59 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/docker-containerd: refer to official website
Message-ID: <20190414212509.B94548A509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b642a660c5354647c68c59f917ca88e6d3b718fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Containerd is no longer maintained under the docker github project and now
has an official website, so refer to that in the help text.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 638504bcdf98d44b09d7964ebaccb81137af1455)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 5e0cc1e877..72ca9313b8 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	help
 	  containerd is a daemon to control runC.
 
-	  https://github.com/docker/containerd
+	  https://containerd.io/
 
 if BR2_PACKAGE_DOCKER_CONTAINERD
 
