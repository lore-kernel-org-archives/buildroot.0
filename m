From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 21:49:38 +0200
Subject: [Buildroot] [git commit] runc: bump to version
	9c2d8d184e5da67c95d601382adf14862e4f2228
Message-ID: <20170406195000.8B6E582711@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d9103258412d4c732ec6f31af1fc1dc43de7a37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a runtime dependency of docker-engine in version 17.04.0-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 916f164..3e188c5 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	bdd0fc0b5db42bb1fc439d5a5d6347d97b285e676559afb620ffd9f62fc1de26	runc-54296cf40ad8143b62dbcaa1d90e520a2136ddfe.tar.gz
+sha256	b5c50d7d9a5f610d5424f96196efa306ec708fd9299302dd919545099c16b7c1	runc-9c2d8d184e5da67c95d601382adf14862e4f2228.tar.gz
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 4282f4e..88bc03f 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 54296cf40ad8143b62dbcaa1d90e520a2136ddfe
+RUNC_VERSION = 9c2d8d184e5da67c95d601382adf14862e4f2228
 RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
