From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu,  5 Apr 2018 23:43:24 +0530
Subject: [Buildroot] [PATCH] docs/manual: use SPDX short identifier for
 license
Message-ID: <1522952004-14578-1-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 docs/manual/adding-packages-cargo.txt | 2 +-
 docs/manual/adding-packages-meson.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index b78163e..b7fc09a 100644
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
index f3b4b30..f8aa08f 100644
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
-- 
2.7.4
