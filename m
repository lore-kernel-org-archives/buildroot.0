From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 15:55:17 +0100
Subject: [Buildroot] [git commit] chrony: bump version
Message-ID: <20141229150127.361A8807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08b1c665171727cae439c440f4502a2424891bdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.hash |    3 +++
 package/chrony/chrony.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
new file mode 100644
index 0000000..ba7f95e
--- /dev/null
+++ b/package/chrony/chrony.hash
@@ -0,0 +1,3 @@
+# From http://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2014/09/msg00000.html
+md5	04ab702fc81150db06809562a9aaed92  chrony-1.31.tar.gz
+sha1	71bb46cad2f15760192795e60efdf23069973908  chrony-1.31.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 7baf417..de80b52 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 1.30
+CHRONY_VERSION = 1.31
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
