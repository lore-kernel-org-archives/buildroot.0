From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 23:17:11 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: add license info
Message-ID: <20130115230053.B84809A1DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbeeaef3a2ae8b03923c26436d3a4f445531e404
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: GPLv2 / GPLv2+ mix as pointed out by Arnout]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltp-testsuite/ltp-testsuite.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index c6b34f0..d0276f2 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -6,5 +6,7 @@
 LTP_TESTSUITE_VERSION = 20101031
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
 LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
+LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
+LTP_TESTSUITE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
