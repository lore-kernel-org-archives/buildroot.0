From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:01:40 +0100
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.147
Message-ID: <20160322090345.148B980503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fedd9caf32025d6eaee1c0c0131db8a50e6baee6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 12a5e3b..9fae427 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 d9f4033db8cf010f46615fa6ece739724f50e10a8564d1e8f1766f71c6fd58f2d3bff3415def8c7bed7319a86980120a3a8665885e3ab6acfe4ac3a8011f749c  LVM2.2.02.146.tgz
+sha512 ec590c9e9b1ebbe5a77053ca4ba82d9c2cc04c69ef768cfd361d94cf23f8f83eda7cbe2f7ebf5f6caf63a08bff73b01734a05614ca24838bf35adc2e50e60d7c  LVM2.2.02.147.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 5ea27b3..ec4dc9f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.146
+LVM2_VERSION = 2.02.147
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
