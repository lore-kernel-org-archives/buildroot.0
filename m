From: Christian Stewart <christian@paral.in>
Date: Thu,  9 Jan 2020 20:50:33 -0800
Subject: [Buildroot] [PATCH 2/2] package/docker-proxy: bump to feeff4
In-Reply-To: <20200110045033.1920685-1-christian@paral.in>
References: <20200110045033.1920685-1-christian@paral.in>
Message-ID: <20200110045033.1920685-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker-proxy (libnetwork) has not added a release tag for a long time. Use the
latest master commit hash from 09 Jan 2020 instead.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-proxy/docker-proxy.hash | 2 +-
 package/docker-proxy/docker-proxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 58de697929..4fa9541bed 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	866c8d196b9396a383b437b0d775476459ed7c11f527c4f6bbf1fd08524b461d	docker-proxy-55685ba49593e67f5e1c8180539379b16736c25e.tar.gz
+sha256  0fffcd438b9a87a7ff8315364ff4631d2241ac0cf9f9f83871aeafcb2a383fd1  docker-proxy-feeff4f0a3fd2a2bb19cf67c826082c66ffaaed9.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14	LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 8843266c30..67f1ae2a90 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = 55685ba49593e67f5e1c8180539379b16736c25e
+DOCKER_PROXY_VERSION = feeff4f0a3fd2a2bb19cf67c826082c66ffaaed9
 DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
-- 
2.24.1
