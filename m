From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:11:11 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/argp-standalone:
 add license file
Message-ID: <20201114125723.8333582624@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9ab0b5825072d6dccbac4b0c5b51ad591652a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Use argp.h as the license file and, while at it, update indentation in
hash file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ad0e1d609be6c9fce1d85e8aeff87af63d9ce158)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/argp-standalone/argp-standalone.hash | 5 ++++-
 package/argp-standalone/argp-standalone.mk   | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/argp-standalone/argp-standalone.hash b/package/argp-standalone/argp-standalone.hash
index 5798214406..c780f9e53f 100644
--- a/package/argp-standalone/argp-standalone.hash
+++ b/package/argp-standalone/argp-standalone.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be  argp-standalone-1.3.tar.gz
+sha256  dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be  argp-standalone-1.3.tar.gz
+
+# License file
+sha256  bbb8919aa520069b0234faf5e83a94052d278419ffe97ca8e843ecc9b212d1ab  argp.h
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 977b9547b6..651bc400f4 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -8,6 +8,7 @@ ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
 ARGP_STANDALONE_INSTALL_STAGING = YES
 ARGP_STANDALONE_LICENSE = LGPL-2.0+
+ARGP_STANDALONE_LICENSE_FILES = argp.h
 
 ARGP_STANDALONE_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
