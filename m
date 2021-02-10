From: Christian Stewart <christian@paral.in>
Date: Wed, 10 Feb 2021 15:52:03 -0800
Subject: [Buildroot] [PATCH v1 3/3] package/docker-cli: bump to version
 20.10.3
In-Reply-To: <20210210235203.2819535-1-christian@paral.in>
References: <20210210235203.2819535-1-christian@paral.in>
Message-ID: <20210210235203.2819535-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Client fixes:

 - Check contexts before importing them to reduce risk of extracted files escaping context store

Signed-off-by: Christian Stewart <christian@paral.in>
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
-- 
2.30.0
