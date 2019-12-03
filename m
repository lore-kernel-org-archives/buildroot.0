From: Christian Stewart <christian@paral.in>
Date: Mon,  2 Dec 2019 20:50:03 -0800
Subject: [Buildroot] [PATCH v1 4/4] package/docker-cli: bump to 19.03.5
In-Reply-To: <20191203045003.145746-1-christian@paral.in>
References: <20191203045003.145746-1-christian@paral.in>
Message-ID: <20191203045003.145746-4-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 061e611735..44f13c8bfc 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cef3f9e8615cde906619f7ab021655a8b974d1b497ce0e5787b1afccbeabb08d  docker-cli-18.09.9.tar.gz
+sha256	00d06baf4793794c0fd9ecad5b7e95aed6eb942f24c8b6e2d7c7f7564b9743ad  docker-cli-19.03.5.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 201d782e1d..4ad30e0278 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 18.09.9
+DOCKER_CLI_VERSION = 19.03.5
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
-- 
2.24.0
