From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:44:21 +0200
Subject: [Buildroot] [git commit] git: bump version to 2.12.2
Message-ID: <20170328194518.AD4FF80008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3967abfc891b69415891ee30945326e6135969f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index e79e8b1..9af360e 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 db11674364b764e101966d829a2e271c9b9d2a8bd4d8ecb4221a1dcdc9a3ada2  git-2.12.1.tar.xz
+sha256 d21a9e23506e618d561fb25a8a7bd6134f927b86147930103487117a7a678c4a  git-2.12.2.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index e7ea98d..b49ddd5 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.12.1
+GIT_VERSION = 2.12.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2, LGPLv2.1+
