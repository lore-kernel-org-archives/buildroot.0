From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 08:09:57 +0200
Subject: [Buildroot] [PATCH 2/3] package/docker-cli: bump version to 18.09.7
In-Reply-To: <20190920060959.28210-1-peter@korsgaard.com>
References: <20190920060959.28210-1-peter@korsgaard.com>
Message-ID: <20190920060959.28210-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes a number of post-18.09.7 bugfixes and to keep in sync with the
docker-engine version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 27bf3322c4..061e611735 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  62e25a0935bee75f999fb95b224ad982054fc1adc4351ce98d704ec00114ce57  docker-cli-18.09.7.tar.gz
+sha256  cef3f9e8615cde906619f7ab021655a8b974d1b497ce0e5787b1afccbeabb08d  docker-cli-18.09.9.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 0cff46abbd..201d782e1d 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 18.09.7
+DOCKER_CLI_VERSION = 18.09.9
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
-- 
2.20.1
