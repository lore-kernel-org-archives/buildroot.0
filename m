From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Apr 2018 21:30:21 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] docs/manual: use SPDX
 short identifier for license
Message-ID: <20180408194523.9CDF180428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce8dd8eec7979658e1b07f6f7e38231595579a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 08bbbe73af0d60ffac4f4476d0583764b81fdfac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-cargo.txt | 2 +-
 docs/manual/adding-packages-meson.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index b78163e6a1..b7fc09acfe 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -41,7 +41,7 @@ package. Let's start with an example:
 07: FOO_VERSION = 1.0
 08: FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
 09: FOO_SITE = http://www.foosoftware.org/download
-10: FOO_LICENSE = GPLv3+
+10: FOO_LICENSE = GPL-3.0+
 11: FOO_LICENSE_FILES = COPYING
 12:
 13: FOO_DEPENDENCIES = host-cargo
diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index f3b4b30e48..f8aa08fa91 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -24,7 +24,7 @@ package. Let's start with an example:
 07: FOO_VERSION = 1.0
 08: FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
 09: FOO_SITE = http://www.foosoftware.org/download
-10: FOO_LICENSE = GPLv3+
+10: FOO_LICENSE = GPL-3.0+
 11: FOO_LICENSE_FILES = COPYING
 12: FOO_INSTALL_STAGING = YES
 13:
