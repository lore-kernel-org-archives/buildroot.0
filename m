From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Jun 2013 20:59:34 +0200
Subject: [Buildroot] [git commit] dosfstools: upstream tarball site changed
Message-ID: <20130609190559.5E77C9AA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06938c3a9e3b3d41606e5d08256671d0d48fbfa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changed their distribution tarball site.
Thanks go to Andrew Scheller from bug #6308 for noticing and reporting.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 624198c..7482bc8 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOSFSTOOLS_VERSION = 3.0.16
-DOSFSTOOLS_SITE = http://fossies.org/linux/misc
+DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_LDFLAGS = $(TARGET_LDFLAGS)
