From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:43:58 +0100
Subject: [Buildroot] [git commit] gdbm: bump to version 1.11 and fix license
Message-ID: <20131226175121.E3BBD9C1A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15fe6f6181493a5f16f3a991037c972523ab5fc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdbm/gdbm.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 60b46c7..12e1dac 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.10
+GDBM_VERSION = 1.11
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
-GDBM_LICENSE = GPLv3
+GDBM_LICENSE = GPLv3+
 GDBM_LICENSE_FILES = COPYING
 GDBM_INSTALL_STAGING = YES
 
