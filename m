From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:33:40 +0200
Subject: [Buildroot] [git commit] package/ser2net: bump to version 4.1.8
Message-ID: <20200602200121.4EF7B82B66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f953135b72c80b207d588e4739969953d00b4989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 91d97e74fc..359ab98ed3 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  504345864f6110d5b6b63ad1f2ba3ed9  ser2net-4.1.7.tar.gz
-sha1  8268c2f7937152a7bbbac6d2f289c257d11deb69  ser2net-4.1.7.tar.gz
+md5  eb08bf2822d5c4293f798d9d8f3c1b66  ser2net-4.1.8.tar.gz
+sha1  e3538f37b99f33a417c34e7b98eb9423262ff19a  ser2net-4.1.8.tar.gz
 # Locally computed:
-sha256  55bbeeed58eda7514ba7a52d14a930e57e1e5c6fd785a84ca0dd7c3b5615e0a5  ser2net-4.1.7.tar.gz
+sha256  cffb5147021202b064eb0a9389d0db63d1bb2dcde5a896f7785f97b1b5f51a72  ser2net-4.1.8.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 1f29e2950e..861f954f76 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.1.7
+SER2NET_VERSION = 4.1.8
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
