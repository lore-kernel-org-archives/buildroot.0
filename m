From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 21:38:30 +0200
Subject: [Buildroot] [git commit] package/docker-cli: add CPE variables
Message-ID: <20210411191302.5EAC4836F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0b37310b782523a3ca97348a0ff6b0dc4830aa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:docker:docker is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adocker%3Adocker

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index d710bb2fee..39b4d09c76 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -12,6 +12,9 @@ DOCKER_CLI_LICENSE_FILES = LICENSE
 
 DOCKER_CLI_DEPENDENCIES = host-pkgconf
 
+DOCKER_CLI_CPE_ID_VENDOR = docker
+DOCKER_CLI_CPE_ID_PRODUCT = docker
+
 DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
 DOCKER_CLI_GOMOD = github.com/docker/cli
