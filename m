From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 23:30:01 +0100
Subject: [Buildroot] [git commit] cups-filters: bump to 1.20.1
Message-ID: <20180309223125.07271828F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db1d9da6d6ea6dbf7049dfb8bf58d579fdcc01b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-filters/cups-filters.hash | 2 +-
 package/cups-filters/cups-filters.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index da9d31c998..043252803f 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 95254d7950df4c74d293ed7dfa0b714f51cff329a82da74a4ac976d342bb35ab  cups-filters-1.17.9.tar.gz
+sha256 f7b3853f9567e0213b4e1602bc670a626c3060e2a043e31b6dee21174d5469a5  cups-filters-1.20.1.tar.gz
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 6d05aa7e31..fd21bff6d4 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.17.9
+CUPS_FILTERS_VERSION = 1.20.1
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
