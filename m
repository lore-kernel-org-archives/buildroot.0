From: Christian Stewart <christian@paral.in>
Date: Mon, 11 May 2020 12:54:03 -0700
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 19.03.8
In-Reply-To: <20200511195403.557773-1-christian@paral.in>
References: <20200511195403.557773-1-christian@paral.in>
Message-ID: <20200511195403.557773-2-christian@paral.in>
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
index 6363461a6a..ef98aed9a7 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	0b5dc158c371b76588345733e164140f3db88c49cbcd7a5f41ea98807da6084b  docker-cli-19.03.7.tar.gz
+sha256	36dd85273c95f4755e08b37ea9660a1bf5c315570b679a0ce268750ca1ed3801  docker-cli-19.03.8.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index b0a4aa9dd3..37f2a0e1c1 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 19.03.7
+DOCKER_CLI_VERSION = 19.03.8
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
-- 
2.26.2
