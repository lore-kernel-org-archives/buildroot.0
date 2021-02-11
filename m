From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 22:30:38 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-cli: bump
 version to 19.03.15
Message-ID: <20210211214512.3DD3B7F8CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f506ce892ae5e73487878ea1e626e607cb9f5349
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Bugfix release, fixing the following issue:

- Check contexts before importing them to reduce risk of extracted files
  escaping context store

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 66abfe5224..e1daa73035 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	21b88a00e8f7a3194c0ae1de5a31e3e1728ef6aa2804158dcb502a8b5fd6ae2b  docker-cli-19.03.13.tar.gz
+sha256	1b577057daf269fabab93b7035d1685aa690118ca7c84e1d772a770a021da883  docker-cli-19.03.15.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index b2ac4a596d..2a6035c2ca 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 19.03.13
+DOCKER_CLI_VERSION = 19.03.15
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
