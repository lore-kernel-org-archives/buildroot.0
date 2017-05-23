From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 23 May 2017 22:08:41 +0200
Subject: [Buildroot] [for-next] package/efl: bump to 1.19.1
Message-ID: <20170523200841.4869-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://www.enlightenment.org/news/efl-1.19.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
This is a bugfix release with a small number of commit.
Can be applied on master if you prefer.
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 39e0f93..eefcbef 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.19.0.tar.xz.sha256
-sha256	a4e0341081778007db414f8cd4e3b77b9d5398870292cab67e6b40cc1445eadf	efl-1.19.0.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.19.1.tar.xz.sha256
+sha256	8c69eaf5f3489245dff6112394bf3685fb9d6fd3915035fe022f27c554e6cd3a	efl-1.19.1.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 04e15f5..766b359 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.19.0
+EFL_VERSION = 1.19.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
-- 
2.9.4
