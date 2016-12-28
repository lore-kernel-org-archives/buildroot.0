From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Dec 2016 11:18:18 +0100
Subject: [Buildroot] [git commit] libsigrokdecode: bump to version 0.4.1
Message-ID: <20161228103540.CAB7F7FDC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60d86c81ccdffb98ed460cbc728eeee4a9891a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see:
https://www.sigrok.org/blog/libsigrokdecode-041-released

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrokdecode/libsigrokdecode.hash | 2 +-
 package/libsigrokdecode/libsigrokdecode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsigrokdecode/libsigrokdecode.hash b/package/libsigrokdecode/libsigrokdecode.hash
index 3ac8a76..ccb2016 100644
--- a/package/libsigrokdecode/libsigrokdecode.hash
+++ b/package/libsigrokdecode/libsigrokdecode.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	fd7e9d1b73245e844ead97a16d5321c766196f946c9b28a8646cab2e98ec3537	libsigrokdecode-0.4.0.tar.gz
+sha256	065f70c10971173d86e03a8cf5534e600c7a622775113997d8061572135d4a95	libsigrokdecode-0.4.1.tar.gz
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index b8b3c59..7006b0c 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROKDECODE_VERSION = 0.4.0
+LIBSIGROKDECODE_VERSION = 0.4.1
 LIBSIGROKDECODE_SITE = http://sigrok.org/download/source/libsigrokdecode
 LIBSIGROKDECODE_LICENSE = GPLv3+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
