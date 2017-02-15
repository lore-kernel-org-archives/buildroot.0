From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:18:26 +0100
Subject: [Buildroot] [git commit] fping: bump to version 3.16
Message-ID: <20170301170421.5B0FE7FB5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1445c78ded351e6dd9265e5be1299d1f2bae93b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fping/fping.hash | 2 +-
 package/fping/fping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 99c01cf..8c1909e 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d86f2281bda4653c7049e6ba8fce24ba67edbf9193b7bb1cf6219b0c8ddce4e6	fping-3.12.tar.gz
+sha256	2f753094e4df3cdb1d99be1687c0fb7d2f14c0d526ebf03158c8c5519bc78f54	fping-3.16.tar.gz
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index c576dd1..5970d63 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 3.12
+FPING_VERSION = 3.16
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
