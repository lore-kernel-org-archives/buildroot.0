From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu,  3 Sep 2015 11:01:57 +0200
Subject: [Buildroot] [PATCH 2/3] package/ltp-testsuite: enable
	power-management tests
In-Reply-To: <1441270918-28981-1-git-send-email-anders.roxell@linaro.org>
References: <1441270918-28981-1-git-send-email-anders.roxell@linaro.org>
Message-ID: <1441270918-28981-3-git-send-email-anders.roxell@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 package/ltp-testsuite/ltp-testsuite.mk | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.1.4
