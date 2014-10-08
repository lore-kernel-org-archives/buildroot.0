From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 19:32:14 +0200
Subject: [Buildroot] [git commit] procps-ng: bump to version 3.3.10
Message-ID: <20141008180329.DCEF2B1427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1058c2d2d9204bea3a903cc92c1d21f4c5aae54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/procps-ng.hash |    3 +++
 package/procps-ng/procps-ng.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/procps-ng/procps-ng.hash b/package/procps-ng/procps-ng.hash
new file mode 100644
index 0000000..e011356
--- /dev/null
+++ b/package/procps-ng/procps-ng.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/procps-ng/files/Production/
+md5	1fb7f3f6bf92ce6c5c9ed9949ae858fe	procps-ng-3.3.10.tar.xz
+sha1	484db198d6a18a42b4011d5ecb2cb784a81b0e4f	procps-ng-3.3.10.tar.xz
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index d82db76..71e32dd 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROCPS_NG_VERSION = 3.3.9
+PROCPS_NG_VERSION = 3.3.10
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
