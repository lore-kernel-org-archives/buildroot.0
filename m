From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 21:52:28 +0100
Subject: [Buildroot] [git commit] gitlab-ci: use our updated docker base
 image
Message-ID: <20191027204638.1E50D8A655@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91d9454644a376c23185dba6d8668c93235b58bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It has python3 and nose for python3! :-)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7e633b3b19..1d71257a20 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20180318.1724
+image: buildroot/base:20191027.2027
 
 .check_base:
     except:
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 33cb665d98..7e6a7598ae 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20180318.1724
+image: buildroot/base:20191027.2027
 
 .check_base:
     except:
