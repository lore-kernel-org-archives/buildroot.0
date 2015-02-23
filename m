From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 18:18:45 +0100
Subject: [Buildroot] [git commit] samba: security bump to version 3.6.25
Message-ID: <20150223171902.D0D6D80D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=340f0a802d7f8451ea52e5ee69637c4784541b99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-0178 - Malformed FSCTL_SRV_ENUMERATE_SNAPSHOTS response.
CVE-2015-0240 - Unexpected code execution in smbd.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.hash |    2 ++
 package/samba/samba.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.hash b/package/samba/samba.hash
new file mode 100644
index 0000000..3a8581a
--- /dev/null
+++ b/package/samba/samba.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	8f2c8a7f2bd89b0dfd228ed917815852f7c625b2bc0936304ac3ed63aaf83751	samba-3.6.25.tar.gz
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index d25e94e..064bfd1 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.24
+SAMBA_VERSION = 3.6.25
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
