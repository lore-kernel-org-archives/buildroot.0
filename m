From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 16:52:00 +0100
Subject: [Buildroot] [git commit] package/docker-cli: bump to version 20.10.3
Message-ID: <20210211153153.EDECF83C80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a73e158f02c1f1421b8e9308ce59b6d2bc331f63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Client fixes:

 - Check contexts before importing them to reduce risk of extracted files escaping context store

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index cf5e80825f..95b15b539b 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ee7cc9c3f6287ca834166aaa1a945790c54d9a8345a1b449a193d9c739f2a7d  docker-cli-20.10.1.tar.gz
+sha256  aafba3765d9013cb75810b4f4334525f0e74e82ef073b4df9e8b524f3794e60a  docker-cli-20.10.3.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 0d1ec02ad7..d90c3b7d10 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.1
+DOCKER_CLI_VERSION = 20.10.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
