From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:21:14 +0100
Subject: [Buildroot] [git commit] package/mdevd: bump to version 0.1.3.0
Message-ID: <20210125210132.AD836838FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98bb425ee0ca98e975dbc384279986d3342d6fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING, update in year:
  https://github.com/skarnet/mdevd/commit/00b25940f6d0458f45ab36ddaff2a1c6d208b6fa
  https://github.com/skarnet/mdevd/commit/05024f93d3cd75c86a89ed1ae6fea0c2b1f1c187
- Update indentation in hash file (two spaces)

https://github.com/skarnet/mdevd/blob/v0.1.3.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdevd/mdevd.hash | 4 ++--
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 6852e55f8e..c3b8fcc921 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 c926b6f9f9f48a73733397f08b6c299a8a2f0eff3d729de7f9d0a763757dab2a  mdevd-0.1.1.2.tar.gz
-sha256 6e32cf6ae38bb82bb8462915ae72d55de59741c8227ae0a637b4012687d9a739  COPYING
+sha256  be89ab072c4de822a06e26579dcca10e85ae5fd5be23ba903415b4de8fe0fb6a  mdevd-0.1.3.0.tar.gz
+sha256  31b60c66aba1fa0a7f8847339ac35c28638e25ff96da700d995533ad810e3995  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index 728c766643..e2924009f5 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.1.2
+MDEVD_VERSION = 0.1.3.0
 MDEVD_SITE = http://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
