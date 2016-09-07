From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 23:01:46 +0200
Subject: [Buildroot] [git commit] package/stress-ng: bump to 0.06.15
Message-ID: <20160907210229.893FD8042E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac184e85ea32eda750a7651c429e9bff7493cc49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index d09edc0..e735439 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7af9759a37902ebf401f92fedeada0b82bcd1e3f4e9e10130177344f143470eb	stress-ng-0.06.02.tar.gz
+sha256	0e1d7733b35f594f7461dedbf836bd4966d0611da4cd4e85cde4804d2a425e6d	stress-ng-0.06.15.tar.gz
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index e12895a..b4d4699 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.06.02
+STRESS_NG_VERSION = 0.06.15
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPLv2+
 STRESS_NG_LICENSE_FILES = COPYING
