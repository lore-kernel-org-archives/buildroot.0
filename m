From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 21 Sep 2018 23:29:07 +0200
Subject: [Buildroot] [PATCH 2/2] igmpproxy: bump to version 0.2.1
In-Reply-To: <20180921212907.17677-1-fontaine.fabrice@gmail.com>
References: <20180921212907.17677-1-fontaine.fabrice@gmail.com>
Message-ID: <20180921212907.17677-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igmpproxy/igmpproxy.hash | 2 +-
 package/igmpproxy/igmpproxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
index 313af52fbe..2566987a7f 100644
--- a/package/igmpproxy/igmpproxy.hash
+++ b/package/igmpproxy/igmpproxy.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 e60331031f85d1fb834c5272a134f32d32e7834718da19ba3f787dff68389a31  igmpproxy-f47644d8fa7266a784f3ec7b251e7d318bc2f0a9.tar.gz
+sha256 6faa1f42ba323f60a9eb4958550e25b2e7e9c645da32c52ba12db0c9bdfce1ba  igmpproxy-0.2.1.tar.gz
 sha256 be3d05af93dbbc4650f8d641d8e1bec220af4a729e07ba71e949c25b93a1b4f6  COPYING
 sha256 c4f65d5d396ad518a37d30b83fe33897661858dc174ff64a15d0461630ce64e4  GPL.txt
 sha256 4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  Stanford.txt
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 9c19f76f0c..fe4614fd13 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGMPPROXY_VERSION = f47644d8fa7266a784f3ec7b251e7d318bc2f0a9
+IGMPPROXY_VERSION = 0.2.1
 IGMPPROXY_SITE = $(call github,pali,igmpproxy,$(IGMPPROXY_VERSION))
 IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
-- 
2.17.1
