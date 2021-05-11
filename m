From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 09:48:45 +0200
Subject: [Buildroot] [git commit] package/lvm2: use http instead of ftp
Message-ID: <20210511072500.C49A086DB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92378c6063020405fd12052b97d1be9d31ad7dae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ftp links do not seem to be accessible anymore. Replace them with http.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 3d560c4be3..9a581527e0 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,4 +1,4 @@
-# From ftp://sources.redhat.com/pub/lvm2/sha512.sum
+# From http://sources.redhat.com/pub/lvm2/sha512.sum
 sha512 f421505551aec2a09bc862f2fcc1ee825bc4d94c53a01d13265631e99308d60fbca40112be5bc7824cce3ef223c0775d2f6c345f6a3f227229a0566c903841bf  LVM2.2.02.185.tgz
 # Locally computed sha256 checksums
 sha256 e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 76f800a15b..653e72c72f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -6,7 +6,7 @@
 
 LVM2_VERSION = 2.02.185
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
-LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
+LVM2_SITE = http://sources.redhat.com/pub/lvm2
 LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
