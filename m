From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:49:25 +0100
Subject: [Buildroot] [git commit] package/zyre: bump version to 2.0.1
Message-ID: <20210308222722.D180687643@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=654ff7951151691dccbc539c45d6357482fdbb23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version bump required due to python setup.py missing from v2.0.0 python bindings

Signed-off-by: Jack Cripps <jack.cripps@disguise.one>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zyre/zyre.hash | 2 +-
 package/zyre/zyre.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zyre/zyre.hash b/package/zyre/zyre.hash
index 289341f494..d9d92d78f2 100644
--- a/package/zyre/zyre.hash
+++ b/package/zyre/zyre.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b978a999947ddb6722d956db2427869b313225e50518c4fbbf960a68109e3e91  zyre-2.0.0.tar.gz
+sha256  624d379dc880025144f58d3a7dc35ea1be4a57ba4e2a58c98ec15a60891be12d  zyre-2.0.1.tar.gz
 sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 21224d6bb4..a726859adf 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZYRE_VERSION = 2.0.0
+ZYRE_VERSION = 2.0.1
 ZYRE_SITE = $(call github,zeromq,zyre,v$(ZYRE_VERSION))
 ZYRE_LICENSE = MPL-2.0
 ZYRE_LICENSE_FILES = LICENSE
