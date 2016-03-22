From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 09:59:58 +0100
Subject: [Buildroot] [git commit] ntfs-3g: bump version to 2016.2.22
Message-ID: <20160322090004.B3FA27FC3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10adda1edd8f67670083d8ef5d97ed6582ef711d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntfs-3g/ntfs-3g.hash | 2 +-
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 1c3445b..4875cc4 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	97f996015d8316d4a272bd2629978e5e97072dd3cc148ce39802f8037c6538f2	ntfs-3g_ntfsprogs-2015.3.14.tgz
+sha256 d7b72c05e4b3493e6095be789a760c9f5f2b141812d5b885f3190c98802f1ea0 ntfs-3g_ntfsprogs-2016.2.22.tgz
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index e5eafb3..b59e335 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2015.3.14
+NTFS_3G_VERSION = 2016.2.22
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
