From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 19:16:14 +0100
Subject: [Buildroot] [git commit] package/xenomai: bump version to 3.0.10
Message-ID: <20191219180847.A02A08D1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45bb8059ae02acf1c207514690f971d8c29137cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xenomai/xenomai.hash | 2 +-
 package/xenomai/xenomai.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 0fc560f978..7da3d0d4a1 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256 9e4b879ee48e6423f76cba5882f41d129164fe977119080ff41ef531ee50dc4e  xenomai-3.0.9.tar.bz2
+sha256 080f893d6ab8e3065285fbb482695477a0502b9490dccd1f744cebaac94691e5  xenomai-3.0.10.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 2577172e32..5f389ac851 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 3.0.9
+XENOMAI_VERSION = 3.0.10
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
