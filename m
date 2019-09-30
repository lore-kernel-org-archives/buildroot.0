From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:45:39 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/docker-cli: bump
 version to 18.09.9
Message-ID: <20190930134102.EF65983690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74cae2b18d53b7f7daa354a55005cedb3ba84df7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Includes a number of post-18.09.7 bugfixes and to keep in sync with the
docker-engine version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c5568f998520ff26d446b9c94850f7e03e9e3863)
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
 
