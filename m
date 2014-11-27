From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 20:34:50 +0100
Subject: [Buildroot] [git commit] git: bump version to 2.2.0
Message-ID: <20141201104839.222237FB2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46ede997d4d152d47cdd6f7af47bdc1cf4ed96b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 2.2.0
- Update the hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.hash |    2 +-
 package/git/git.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 3f8db5f..33fed89 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  fe1b06aefa73e8d86cbd352523fc0950b8904ae2ec47085b22b7880f45de6f57  git-2.1.3.tar.xz
+sha256  3b87774672bbf35b4d33991dc5119d4eff47c3679e27185312a2b8b36fdad314  git-2.2.0.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index f338438..9e931a1 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.1.3
+GIT_VERSION = 2.2.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
