From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:21:13 +0200
Subject: [Buildroot] [git commit] package/docker-containerd: refer to
 official website
Message-ID: <20190407131803.F37C78004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=638504bcdf98d44b09d7964ebaccb81137af1455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Containerd is no longer maintained under the docker github project and now
has an official website, so refer to that in the help text.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 35867df21a..9568dd0a2a 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 	help
 	  containerd is a daemon to control runC.
 
-	  https://github.com/docker/containerd
+	  https://containerd.io/
 
 if BR2_PACKAGE_DOCKER_CONTAINERD
 
