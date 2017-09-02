From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:00:00 +0200
Subject: [Buildroot] [git commit] luaossl: bump to version 20170901
Message-ID: <20170902195515.0640C8041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1348dd042987a30628279b613fb579329964660e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luaossl/luaossl.hash | 2 +-
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index ea9f5e3..84e6e64 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	51641d8971c19b2c65d3954ded12c306d4ecf6315ff8f1ec584e9a23ca998576  luaossl-20161214-0.src.rock
+sha256 9c1df5a0e83f0f867850047f5e42009a15864fb7e40afa028d86523bcc840fae  luaossl-20170901-0.src.rock
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 5bb3e82..07d4ef2 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20161214
+LUAOSSL_VERSION_UPSTREAM = 20170901
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
