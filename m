From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 12:09:40 +0200
Subject: [Buildroot] [git commit] tcpreplay: bump to version 4.0.5
Message-ID: <20141007101107.121ECB0CA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15b28bcd26b0fa592d9ee49d3578d818bc1f19eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash |    3 +++
 package/tcpreplay/tcpreplay.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
new file mode 100644
index 0000000..d7e8f1d
--- /dev/null
+++ b/package/tcpreplay/tcpreplay.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/tcpreplay/files/tcpreplay/4.0.5/
+md5	1a6f108a62bf526eeffa2998a6f311af	tcpreplay-4.0.5.tar.gz
+sha1	878970d77e1482c9b26ac19eb2d125915a900f9b	tcpreplay-4.0.5.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 4338c9d..e937af9 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.0.4
+TCPREPLAY_VERSION = 4.0.5
 TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
