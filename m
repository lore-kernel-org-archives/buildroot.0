From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 22:02:19 +0200
Subject: [Buildroot] [git commit] stress-ng: update to 0.06.02
Message-ID: <20160516200240.620B1802AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08fe324b8b0e12a2ada22db8ee268a99cdde4322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following autobuilder errors:
http://autobuild.buildroot.net/results/b527ccdbdfeaba6789528e68df93d9c7216e758a/
http://autobuild.buildroot.net/results/d658f82c66d93515276dcb6cec8d3690459fbf05/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 4979303..d09edc0 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9d17dffafdf8dd71eb5c191973b65d4eb2964ecc31f1d01ad188fd03a0c49f6c	stress-ng-0.04.16.tar.gz
+sha256	7af9759a37902ebf401f92fedeada0b82bcd1e3f4e9e10130177344f143470eb	stress-ng-0.06.02.tar.gz
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 114c427..6015a1e 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.04.16
+STRESS_NG_VERSION = 0.06.02
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPLv2+
 STRESS_NG_LICENSE_FILES = COPYING
