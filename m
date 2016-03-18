From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 21:52:47 +0100
Subject: [Buildroot] [git commit] git: bump version to 2.7.4
Message-ID: <20160318205619.735AE81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d73629bb2e4613abd31aa74c686b0a217aca0c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 802855d..f0b9201 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 1c0170952163e0b240256bc47388b95c617cf8cf446c93261df83d42cf5dd466  git-2.6.4.tar.xz
+sha256 dee574defbe05ec7356a0842ddbda51315926f2fa7e39c2539f2c3dcc52e457b  git-2.7.4.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 8d9d3ab..41737de 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.6.4
+GIT_VERSION = 2.7.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
