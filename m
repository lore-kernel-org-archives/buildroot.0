From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 20:34:34 +0100
Subject: [Buildroot] [git commit] package/minicom: bump version
Message-ID: <20200101192527.D56DA8EA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2498044007cfefa4bac543399153db2592b83e4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shortlog follows:
Adam Lackorzynski (2):
      minicom.c: Convert TABs to spaces
      minicom.c: Reflow long_options

Rasmus Villemoes (1):
      Allow user to specify buffering mode of capture file

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 03e1dcc7d0..9725f58f6d 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 be5d923c399bc15dade7bc89052d887034abd49b386138c16bdcb912f2135098  minicom-5086119bbaafd2f8986579209885635b92020096.tar.gz
+sha256 c8e34cc583f3b09c65871f5080b04799895b1ebd72092c0e18cb20a631f6c4b1  minicom-a6a507dcb8bd4cb5da7af9e2dc75b8e495fedbb6.tar.gz
 sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index c08e9b10f4..a86d587b2f 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 5086119bbaafd2f8986579209885635b92020096
+MINICOM_VERSION = a6a507dcb8bd4cb5da7af9e2dc75b8e495fedbb6
 MINICOM_SITE = https://salsa.debian.org/minicom-team/minicom.git
 MINICOM_SITE_METHOD = git
 MINICOM_LICENSE = GPL-2.0+
