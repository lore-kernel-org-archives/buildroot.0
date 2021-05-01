From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 May 2021 14:13:56 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/lxc: bump to
 version 4.0.6
Message-ID: <20210501115434.5F5B18677A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99a0e9ed5ed02004c22449af87ec6bd7b422e9e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

"The LXC 4.0 branch is supported until June 2025. Only bugfixes and
securitiy issues get included into the stable bugfix releases, so it's
always safe and recommended to keep up and run the latest bugfix
release."

https://discuss.linuxcontainers.org/t/lxc-4-0-6-lts-has-been-released/9926

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c5aedfe041569fed6ca7ffce943f3e3b8b024b61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 4cecf6b0f7..85cdecceb2 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  af2cd616d5ab689e5d2305361c6571b5e632afd7eaab1754cca1670446a2e6a4  lxc-4.0.5.tar.gz
+sha256  9165dabc0bb6ef7f2fda2009aee90b20fbefe77ed8008347e9f06048eba1e463  lxc-4.0.6.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 576036e246..24a1f3c588 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.5
+LXC_VERSION = 4.0.6
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
