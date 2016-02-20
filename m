From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:09:36 +0100
Subject: [Buildroot] [git commit] package/systemd: bump version to 229
Message-ID: <20160302202753.CF08C80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c31487c6c69db8624300bf3c349ac2fc12d15590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 8090200..7295986 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 dd124ff561a07e6439ed2b3713f38ca914df7747f110ce86deea17b56d245ae6  systemd-228.tar.gz
+sha256 b51b0a48d1beb388d95bd6a98d62be05490335d4bb388aefecdcb576e91e0741  systemd-229.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e432069..b2cce11 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 228
+SYSTEMD_VERSION = 229
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
