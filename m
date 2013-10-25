From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 09:15:27 +0200
Subject: [Buildroot] [git commit] dosfstools: bump to version 3.0.23
Message-ID: <20131025073057.0C8009BBAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f6b39bc420215ee2520991a3081f799bbd157ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index c94f680..6b27e80 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 3.0.22
+DOSFSTOOLS_VERSION = 3.0.23
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
