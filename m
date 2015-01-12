From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 12:31:41 +0100
Subject: [Buildroot] [git commit] samba4: bump to version 4.1.15
Message-ID: <20150112113149.8709480450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77a1d41b3968b6d1594efafc2bf78761cda0e152
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.hash |    2 +-
 package/samba4/samba4.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e6990bd..bd6f6e9 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5ea14baaca997292355d368918879e3d639def92b54efef2279cf5abe8db2cba	samba-4.1.14.tar.gz
+sha256	9d84112124512428ddc9cc0d9975524bab730b9a598a9ff90458666afb3f42f4	samba-4.1.15.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3ac0325..4a2f207 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.14
+SAMBA4_VERSION = 4.1.15
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
