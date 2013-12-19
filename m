From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 22:33:21 +0100
Subject: [Buildroot] [git commit] pcre: bump to version 8.34
Message-ID: <20131219213349.B8E709C0EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86c5d5932b4dc310adfa7df312e08aac9af29319
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/pcre.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 2637354..14d3aa3 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.33
+PCRE_VERSION = 8.34
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
