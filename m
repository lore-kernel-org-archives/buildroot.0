From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:25:46 +0200
Subject: [Buildroot] [git commit] lxc: bump version to 1.1.4
Message-ID: <20151014202550.F3BBD81E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cc7eab235725d51b985e493349e58f923a85c54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.hash |    2 +-
 package/lxc/lxc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index dcc532c..d5b8ec5 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 34ba517ffd7b38a14e5d12d56a4928b78602d56311d5f47c3ef90f4e714b9604 lxc-1.1.2.tar.gz
+sha256 8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc lxc-1.1.4.tar.gz
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index c7ebda4..b11464e 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 1.1.2
+LXC_VERSION = 1.1.4
 LXC_SITE = https://linuxcontainers.org/downloads
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
