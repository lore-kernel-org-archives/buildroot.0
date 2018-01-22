From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:28:11 +0100
Subject: [Buildroot] [git commit] boinc: bump to version 7.8.6
Message-ID: <20180122213642.C102683E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da00b5db798f02abc01ad11d99c1cea809e8292e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 3e4c221..8f44982 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 e03736026e048a06793bd19d3e613d4053f56fd34fbc8990258705ed3c98cf38  boinc-7.8.5.tar.gz
+sha256 ed5f3dcdc8d1cc5277529afb701377e77d1ff89711368a7456553bf249940bad  boinc-7.8.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index f4cad3e..0105034 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 7.8
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).6
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
