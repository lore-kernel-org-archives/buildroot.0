From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:58:43 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] liburiparser: bump to
 version 0.8.6
Message-ID: <20181113225614.E745282DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e91d6df5bed5531cd1eedd024231244dfa2f5360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Version 0.8.6 is a bugfix release including a nasty bug that has
potential to crash applications when parsing certain URIs (like
"//:%aa@", excluding quotes).

For more details please check the change log at

    https://github.com/uriparser/uriparser/blob/uriparser-0.8.6/ChangeLog

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cba4062a34c62a4539cf8b0e6e5e033ddde8d344)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index c03e832f9f..1fd65d2f19 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  58eacd5c03d9e341c04eb0b30831faec89f3b415949ff8d72254e63432352cdd  uriparser-0.8.5.tar.bz2
+sha256  0709a7e572417db763f0356250d91686c19a64ab48e9da9f5a1e8055dc2a4a54  uriparser-0.8.6.tar.bz2
 sha256  ee90029e62d11f48faa59360d15c3ad8e7c094c74cc25b055716d92340da561f  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 4b32b7f7f2..baed4506a4 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.8.5
+LIBURIPARSER_VERSION = 0.8.6
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
