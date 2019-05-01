From: Christian Stewart <christian@paral.in>
Date: Wed,  1 May 2019 11:49:00 -0700
Subject: [Buildroot] [PATCH v1 3/4] package/docker-cli: bump to version
 18.09.5
In-Reply-To: <20190501184901.29441-1-christian@paral.in>
References: <20190501184901.29441-1-christian@paral.in>
Message-ID: <20190501184901.29441-3-christian@paral.in>
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
index 41686f0de8..987fbba3e9 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f9be44f395617f3f75faac69ad90f93c94ee4050c193bfa05eddb520a27c5d44  docker-cli-v18.09.4.tar.gz
+sha256	dfed7e3b14643101e6d3746e722cbe8294dcf078c5405f3fb78bc38c7c17f0b1  docker-cli-v18.09.5.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 65701d1530..3ee9f5ca72 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = v18.09.4
+DOCKER_CLI_VERSION = v18.09.5
 DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
-- 
2.21.0
