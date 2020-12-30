From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 09:32:47 +0100
Subject: [Buildroot] [git commit] package/docker-cli: bump version to 20.10.1
Message-ID: <20201230081937.CBC5782A51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a3930cbfa347c9855e991f98feee2a20964c0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, fix the formatting of the hash file for the LICENSE file
hash.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-cli/docker-cli.hash | 4 ++--
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 66abfe5224..cf5e80825f 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	21b88a00e8f7a3194c0ae1de5a31e3e1728ef6aa2804158dcb502a8b5fd6ae2b  docker-cli-19.03.13.tar.gz
-sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
+sha256  4ee7cc9c3f6287ca834166aaa1a945790c54d9a8345a1b449a193d9c739f2a7d  docker-cli-20.10.1.tar.gz
+sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 86fffafdb8..0d1ec02ad7 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 19.03.13
+DOCKER_CLI_VERSION = 20.10.1
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
