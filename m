From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 09:48:30 +0100
Subject: [Buildroot] [git commit] avrdude: fix typo in variable name
Message-ID: <20170207090318.AF6BD7FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e71b2381463e98785cf69abec8e563333f3e9f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/avrdude.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 327618a..27a74de 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -7,7 +7,7 @@
 AVRDUDE_VERSION = ad04c429a90f4c34f000ea4ae11db2705915a31f
 AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPLv2+
-AVRDUDR_LICENSE_FILES = avrdude/COPYING
+AVRDUDE_LICENSE_FILES = avrdude/COPYING
 AVRDUDE_SUBDIR = avrdude
 # Sources coming from git, without generated configure and Makefile.in
 # files.
