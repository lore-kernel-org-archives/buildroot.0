From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 21:21:23 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] .gitlab-ci.yml: use image
 with flake8
Message-ID: <20180506192207.8BBDF8A489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2502d4f393065e73918362f6e3e8074bb0cc0a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Bump the docker image to the latest tag to have flake8 pre-installed.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 12b08c2be639e26ba0983d7dbdb3bddd91355f4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 027c1c6053..661a3d38e1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20180205.0730
+image: buildroot/base:20180318.1724
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index cb3eb715f2..c0e9563f2f 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20180205.0730
+image: buildroot/base:20180318.1724
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
