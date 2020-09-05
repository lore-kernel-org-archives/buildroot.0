From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 22:04:27 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] gitlab-ci: update the
 image version
Message-ID: <20200905195637.8F0B284762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a504792ef09dc3dc2a7783d136a2b7857a479168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7f654438c4bbb8605f0867d17b9e79882de11433)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a7f088767cb5260f23ef95b7485b5ea09e1112ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 389592e3b7..60f54642fa 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20191027.2027
+image: buildroot/base:20200814.2228
 
 .check_base:
     rules:
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 1facd2a66f..2d26f38011 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20191027.2027
+image: buildroot/base:20200814.2228
 
 .check_base:
     rules:
