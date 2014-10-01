From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Oct 2014 15:57:44 +0200
Subject: [Buildroot] [git commit] pcre: bump to version 8.36
Message-ID: <20141001135818.5C3E59D759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45f7fb51edde1f37ab69bfa03eae541ed3dad8ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/pcre.hash |    3 +++
 package/pcre/pcre.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
new file mode 100644
index 0000000..56c5a17
--- /dev/null
+++ b/package/pcre/pcre.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/pcre/files/pcre/8.36/
+md5	ff7b4bb14e355f04885cf18ff4125c98	pcre-8.36.tar.gz
+sha1	fb537757756818133d8157ec878bc11f5a93ef4d	pcre-8.36.tar.gz
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 2077896..ca495bd 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.35
+PCRE_VERSION = 8.36
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
