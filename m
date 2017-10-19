From: Christian Stewart <christian@paral.in>
Date: Wed, 18 Oct 2017 20:22:55 -0400
Subject: [Buildroot] [PATCH 10/12] docker-proxy: bump to 9647f99
In-Reply-To: <20171019002257.27646-1-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
Message-ID: <20171019002257.27646-10-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps docker-proxy to:

  9647f993a81e404639592e8ed73693b48ec09c2e

This is a dependency of docker v2017.07:

docker/docker-ce#c867dee see components/engine/vendor.conf.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-proxy/docker-proxy.hash | 2 +-
 package/docker-proxy/docker-proxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 3ec184f54f..4e6ba72133 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2eee331b6ded567a36e7db708405b34032b93938682cf049025f48b96d755bf6	docker-proxy-7b2b1feb1de4817d522cc372af149ff48d25028e.tar.gz
+sha256	dc0aa06e490fcdb799414f339570f85b474500aecb82aeeb3b7c8215d558dbff	docker-proxy-9647f993a81e404639592e8ed73693b48ec09c2e.tar.gz
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 3bf6546d26..330ecd527f 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = 7b2b1feb1de4817d522cc372af149ff48d25028e
+DOCKER_PROXY_VERSION = 9647f993a81e404639592e8ed73693b48ec09c2e
 DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
-- 
2.13.6
