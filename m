From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:36:09 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] support/docker: use
 python3-flake8
Message-ID: <20200828164643.1E526865B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89f369263ed542b11a854f3ba59067374a65fc21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

support/scripts/pkg-stats now uses some Python 3.x only constructs
("async" and related keywords), so we must use the Python 3.x flake8.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 385c4da3dd10b6bfbaf23c04f48e7835ce5cc701)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 03acde85d2..8c555dcf7a 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -36,10 +36,10 @@ RUN apt-get install -y --no-install-recommends \
         libncurses5-dev \
         locales \
         mercurial \
-        python-flake8 \
         python-nose2 \
         python-pexpect \
         python3 \
+        python3-flake8 \
         python3-nose2 \
         python3-pexpect \
         qemu-system-arm \
