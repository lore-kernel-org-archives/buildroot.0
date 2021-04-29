From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Apr 2021 11:14:04 +0200
Subject: [Buildroot] [git commit] package/efl: bump to version 1.25.1
Message-ID: <20210429084946.6A5B781038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2814c077f814d3459225c865fb6c6320dd8216c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://www.enlightenment.org/news/efl-1.25.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 11e69633b9..69008cde23 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.25.0.tar.xz.sha256sum
-sha256  53941f910daf5d1b5162bfdb0dc66f1a04e55a0f2dd7760da0ad63713370956e  efl-1.25.0.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.25.1.tar.xz.sha256sum
+sha256  351ca0211ca000234527a503585f039f985607ec9439e34b49d8b8bbf35a7e6b  efl-1.25.1.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d77cb3092b..cdb05aa551 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.25.0
+EFL_VERSION = 1.25.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
