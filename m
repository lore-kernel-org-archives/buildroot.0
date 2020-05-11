From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2020 11:53:18 +0200
Subject: [Buildroot] [PATCH] packager/docker-cli: bump version to 19.03.7
Message-ID: <20200511095318.13251-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To match the docker-engine version.

./support/testing/run-tests tests.package.test_docker_compose.TestDockerCompose
09:54:39 TestDockerCompose                        Starting
09:54:40 TestDockerCompose                        Building
10:45:33 TestDockerCompose                        Building done
10:46:30 TestDockerCompose                        Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 3121.828s

OK

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 44f13c8bfc..6363461a6a 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	00d06baf4793794c0fd9ecad5b7e95aed6eb942f24c8b6e2d7c7f7564b9743ad  docker-cli-19.03.5.tar.gz
+sha256	0b5dc158c371b76588345733e164140f3db88c49cbcd7a5f41ea98807da6084b  docker-cli-19.03.7.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 4ad30e0278..b0a4aa9dd3 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 19.03.5
+DOCKER_CLI_VERSION = 19.03.7
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
-- 
2.20.1
