From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:53:46 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/docker-cli: bump
 to version 19.03.12
Message-ID: <20200915185442.741308151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55e97d22a7b4bded83d597fba1884dea95d93764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e3d734c4310001e285b186b61c8f41aae29d90ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 8868a60e38..8f9e69e593 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a5b1d6c5766f77896273e864a448a7f0ea4055bb52f50f884f14ad6ef0d5fdb4  docker-cli-19.03.11.tar.gz
+sha256	00801d6b7e9777cf2cf54255ca5afb7b58b3d35c14bb0f60bb9f07d031883223  docker-cli-19.03.12.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 766c984f0b..49abefcaf2 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 19.03.11
+DOCKER_CLI_VERSION = 19.03.12
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
