From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:49:12 +0200
Subject: [Buildroot] [git commit] package/docker-engine: drop
 <pkg>_SRC_SUBDIR variable
Message-ID: <20200902161638.2404885EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfcf745e10f354c419e305f3ac334764becdeff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the go.mod integration, the DOCKER_ENGINE_SRC_SUBDIR has become
useless, drop it.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/docker-engine.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 992a3448a0..2119a883bc 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -11,7 +11,6 @@ DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
-DOCKER_ENGINE_SRC_SUBDIR = github.com/docker/docker
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
 DOCKER_ENGINE_LDFLAGS = \
