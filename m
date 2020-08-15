From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Aug 2020 09:47:00 +0200
Subject: [Buildroot] [git commit] gitlab-ci: update the image version
Message-ID: <20200815074343.9E7CB85F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f654438c4bbb8605f0867d17b9e79882de11433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml                | 2 +-
 support/misc/gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5c6ca69c81..e85ac32033 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: buildroot/base:20191027.2027
+image: buildroot/base:20200814.2228
 
 stages:
   - generate-gitlab-ci
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 75ffaab8fe..dddebf09e9 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: buildroot/base:20191027.2027
+image: buildroot/base:20200814.2228
 
 .check_base:
     rules:
