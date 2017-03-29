From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:51:34 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.169
Message-ID: <20170329195155.668247FCD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0811fbdf780e82d6d962af4e28d02e9f44d8d4b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 3619af8..a66b0c5 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 ebff909e1c81919967373c55c7a95ba13ef4e0536b8ef1c28ed7e1c1eb9b9fd406a649d93b141822b24675ebece5a722247737c4e869fb7fb5eeb881a7f9102d  LVM2.2.02.168.tgz
+sha512 0ff2418c54686f1a99d6196bab5fbc8188152d17ae826760aabd91b49e5f20d19ed1280e3670a769184aac9fd598a20b31312b56add831ed3863473e031b5327  LVM2.2.02.169.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index a2d484b..6af3137 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.168
+LVM2_VERSION = 2.02.169
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
