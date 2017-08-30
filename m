From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:26:02 +0200
Subject: [Buildroot] [git commit] package/efl: bump to 1.20.2
Message-ID: <20170902130620.E6B378016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688fff1403c5aaceef4fb937cc60d28cb6629dad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See: https://www.enlightenment.org/news/efl-1.20.2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index eefcbef..9d553ad 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.19.1.tar.xz.sha256
-sha256	8c69eaf5f3489245dff6112394bf3685fb9d6fd3915035fe022f27c554e6cd3a	efl-1.19.1.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.2.tar.xz.sha256
+sha256	a540cb96f0a2a8f2e3001108d8432d2f21b45f6b12bd511eeebaadd5c934947e	efl-1.20.2.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 9cbbabb..b4cdeed 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.19.1
+EFL_VERSION = 1.20.2
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
