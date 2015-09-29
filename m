From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2015 13:51:34 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: enable
	power-management tests
Message-ID: <20150929120702.822FD800D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fa2868b3ed92fc273803d9772b2d209035f9457
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 48733f2..634fc45 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -10,6 +10,7 @@ LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/l
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 LTP_TESTSUITE_CONF_OPTS += \
+			   --with-power-management-testsuite \
 			   --with-realtime-testsuite
 
 # Needs libcap with file attrs which needs attr, so both required
