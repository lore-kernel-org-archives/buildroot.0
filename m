From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Oct 2019 21:45:04 +0100
Subject: [Buildroot] [PATCH 2/2] gitlab-ci: use our updated docker base image
In-Reply-To: <cover.1572209096.git.yann.morin.1998@free.fr>
References: <cover.1572209096.git.yann.morin.1998@free.fr>
Message-ID: <c9d92f6f985ac61252d6d2551650b11d9a159c8b.1572209096.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It has python3 and nose for python3! :-)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
-- 
2.20.1
