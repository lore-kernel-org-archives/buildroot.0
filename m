From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 1 Dec 2016 11:17:44 +0000
Subject: [Buildroot] [PATCH next] lvm2: bump version to 2.02.168
Message-ID: <20161201111744.32599-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index edc9360..3619af8 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 492b2f5ca462dbbb8e182befdb6ca60c7a31b16a39f59a38cabdcd0996d9e2c49ae56a2289def80b89da738176ac55cf13cbefd401feb7a1e3a6ef9a4c267f2b  LVM2.2.02.167.tgz
+sha512 ebff909e1c81919967373c55c7a95ba13ef4e0536b8ef1c28ed7e1c1eb9b9fd406a649d93b141822b24675ebece5a722247737c4e869fb7fb5eeb881a7f9102d  LVM2.2.02.168.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index dd57421..ae9581c 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.167
+LVM2_VERSION = 2.02.168
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.10.1
