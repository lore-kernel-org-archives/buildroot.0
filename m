From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Apr 2021 09:00:33 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/docker-cli: add
 CPE variables
Message-ID: <20210425065504.2E28E81539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bac683c71d6c4f116bc983800442e1f7357d8177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:docker:docker is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adocker%3Adocker

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b0b37310b782523a3ca97348a0ff6b0dc4830aa5)
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
