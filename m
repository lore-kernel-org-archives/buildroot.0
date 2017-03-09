From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:53:25 +0100
Subject: [Buildroot] [git commit] ti-uim: bump to latest version
Message-ID: <20170309205330.C0188818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=497ed4ea664161da0b6e84b833fc47dfa44db3a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, add a hash file.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-uim/ti-uim.hash | 2 ++
 package/ti-uim/ti-uim.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ti-uim/ti-uim.hash b/package/ti-uim/ti-uim.hash
new file mode 100644
index 0000000..ea64540
--- /dev/null
+++ b/package/ti-uim/ti-uim.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 da8a66968f4bf99366ab2b63baf358d937a6b1a5636ef6179c3aa7c852cbd1b2 ti-uim-a0236bc252e6484835ce266ae4a50b361f6a902d.tar.gz
diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
index 1c78db0..a6e19b8 100644
--- a/package/ti-uim/ti-uim.mk
+++ b/package/ti-uim/ti-uim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
+TI_UIM_VERSION = a0236bc252e6484835ce266ae4a50b361f6a902d
 TI_UIM_SITE = $(call github,96boards,uim,$(TI_UIM_VERSION))
 TI_UIM_LICENSE = GPLv2+
 
