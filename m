From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:01:45 +0200
Subject: [Buildroot] [git commit] s6: bump version to 2.6.1.0
Message-ID: <20170909195854.50450806C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bba8f9f6a625d3cc153f91d6e45eef8fd6985ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 1d35c4e..41f3dff 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 146dd54086063c6ffb6f554c3e92b8b12a24165fdfab24839de811f79dcf9a40  s6-2.6.0.0.tar.gz
+sha256 f0de303791134302f2630b9fe76a936b064e1e3aa772c8ae1b891155a6ea2c79  s6-2.6.1.0.tar.gz
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 4daf1e7..da9917c 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.6.0.0
+S6_VERSION = 2.6.1.0
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
