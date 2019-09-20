From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 08:09:58 +0200
Subject: [Buildroot] [PATCH 3/3] package/docker-proxy: bump version to
 55685ba49593
In-Reply-To: <20190920060959.28210-1-peter@korsgaard.com>
References: <20190920060959.28210-1-peter@korsgaard.com>
Message-ID: <20190920060959.28210-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Which is the version used by docker 18.09.9:

https://github.com/docker/engine/commit/0a3767c7e9803f0a595a07b0548e99d60e861062

Also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-proxy/docker-proxy.hash | 3 ++-
 package/docker-proxy/docker-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 3ec184f54f..58de697929 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	2eee331b6ded567a36e7db708405b34032b93938682cf049025f48b96d755bf6	docker-proxy-7b2b1feb1de4817d522cc372af149ff48d25028e.tar.gz
+sha256	866c8d196b9396a383b437b0d775476459ed7c11f527c4f6bbf1fd08524b461d	docker-proxy-55685ba49593e67f5e1c8180539379b16736c25e.tar.gz
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14	LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index dfa9d4347d..8843266c30 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = 7b2b1feb1de4817d522cc372af149ff48d25028e
+DOCKER_PROXY_VERSION = 55685ba49593e67f5e1c8180539379b16736c25e
 DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
-- 
2.20.1
