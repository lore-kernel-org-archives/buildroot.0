From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 12:18:41 +0200
Subject: [Buildroot] [git commit] package/efl: bump to 1.20.5
Message-ID: <20171022101733.5E39C810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=013b1faa1edc10f051db6f95c294a6538afcb1e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.enlightenment.org/news/efl-1.20.5

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index e388f50..edc72c2 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.4.tar.xz.sha256
-sha256	316135c402758945d51d3b316addbeb1d537a0d75f9cf593868646fd8251b0cb 	efl-1.20.4.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.5.tar.xz.sha256
+sha256	da5e69b81c94b79f4e31cfc312413c36acb7429e1cb6fd4397a1251a0e23c21c 	efl-1.20.5.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index f456928..e0748d2 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.20.4
+EFL_VERSION = 1.20.5
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
