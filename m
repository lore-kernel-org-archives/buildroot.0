From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 22 Jun 2016 23:27:44 +0200
Subject: [Buildroot] [PATCH v3 3/5] package/elementary: bump to 1.17.1
In-Reply-To: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466630866-28779-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no elementary 1.17.2 release since there was no patch to
backport from upstream.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Note: elementary has been merged within efl tree for 1.18 release,
this package will be removed with the next efl update.
---
 package/elementary/elementary.hash | 4 ++--
 package/elementary/elementary.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elementary/elementary.hash b/package/elementary/elementary.hash
index ecdbc8e..f173752 100644
--- a/package/elementary/elementary.hash
+++ b/package/elementary/elementary.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.15.3.tar.xz.sha256
-sha256	474a9175061021ce8cbcfdbde6162316fc0d927b21118d1ab549377ebc802a93	elementary-1.15.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.17.1.tar.xz.sha256
+sha256	85e116a453a8ac23da878670534c6292832756d2f3a33603278486f309963d91	elementary-1.17.1.tar.xz
diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index 7de0c7b..33d4034 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELEMENTARY_VERSION = 1.15.3
+ELEMENTARY_VERSION = 1.17.1
 ELEMENTARY_SOURCE = elementary-$(ELEMENTARY_VERSION).tar.xz
 ELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 ELEMENTARY_LICENSE = LGPLv2.1
-- 
2.5.5
