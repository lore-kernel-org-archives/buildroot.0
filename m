From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:50:36 +0100
Subject: [Buildroot] [git commit] lftp: bump version to 4.6.1
Message-ID: <20150106205120.80BCE807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60fe91b2e016570cb866e97046fe428692af3b76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-Bump version to 4.6.1
-Add a hash file
-Use xz tarball to save space and bandwidth

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/lftp.hash |    2 ++
 package/lftp/lftp.mk   |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
new file mode 100644
index 0000000..328d545
--- /dev/null
+++ b/package/lftp/lftp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d1eea1ed98d05e050b909d5a90e8c7f345c84781b91af36d944fb2f33eba35bf  lftp-4.6.1.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 1586579..7494ea2 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.5.5
+LFTP_VERSION = 4.6.1
+LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
