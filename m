From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 14:44:01 -0800
Subject: [Buildroot] [git commit] oprofile: add license information
Message-ID: <20121204225020.09AC59995B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0975586ee3241988afc504f1e19494ef13b3189
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: GPLv2+ as pointed out by Arnout]
Signed-off-by: Simon Dawson <simond@trainfx.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/oprofile/oprofile.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 54c46dd..75f8407 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -6,6 +6,8 @@
 
 OPROFILE_VERSION = 0.9.7
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
+OPROFILE_LICENSE = GPLv2+
+OPROFILE_LICENSE_FILES = COPYING
 OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
