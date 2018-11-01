From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:33:07 +0100
Subject: [Buildroot] [git commit] python-async-timeout: add missing blank
 line in .mk file
Message-ID: <20181101123128.D2E3583C23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c025e7570de0fbe209efeac627b3fd408c1385d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/python-async-timeout/python-async-timeout.mk:6: should be a blank line (http://nightly.buildroot.org/#writing-rules-mk)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-async-timeout/python-async-timeout.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index dc14e14b56..093adc5c19 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -3,6 +3,7 @@
 # python-async-timeout
 #
 ################################################################################
+
 PYTHON_ASYNC_TIMEOUT_VERSION = 3.0.1
 PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
 PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a1/78/aae1545aba6e87e23ecab8d212b58bb70e72164b67eb090b81bb17ad38e3
