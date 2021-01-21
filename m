From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 Jan 2021 23:13:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/docker-containerd: add CPE variables
Message-ID: <20210121221352.2373527-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:linuxfoundation:containerd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxfoundation%3Acontainerd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-containerd/docker-containerd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 418d588070..626889e5f4 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -8,6 +8,8 @@ DOCKER_CONTAINERD_VERSION = 1.4.3
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
+DOCKER_CONTAINERD_CPE_ID_VENDOR = linuxfoundation
+DOCKER_CONTAINERD_CPE_ID_PRODUCT = containerd
 
 DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
 
-- 
2.29.2
