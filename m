From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Apr 2019 20:23:49 +0200
Subject: [Buildroot] [PATCH 5/7] package/docker-containerd: refer to
 official website
In-Reply-To: <20190401182352.26342-1-peter@korsgaard.com>
References: <20190401182352.26342-1-peter@korsgaard.com>
Message-ID: <20190401182352.26342-6-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Containerd is no longer maintained under the docker github project and now
has an official website, so refer to that in the help text.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
-- 
2.11.0
