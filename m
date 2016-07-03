From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:20:01 +0200
Subject: [Buildroot] [git commit] python-pycrypto: add explicit dependencies
	for host variant
Message-ID: <20160703072403.690EA81E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0188bae5403cb4dd924fff238ce144c317a3842e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycrypto/python-pycrypto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
index 71943fa..927ba91 100644
--- a/package/python-pycrypto/python-pycrypto.mk
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -26,6 +26,7 @@ HOST_PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
 PYTHON_PYCRYPTO_LICENSE_FILES += LEGAL/copy/LICENSE.original
 
 PYTHON_PYCRYPTO_DEPENDENCIES = gmp
+HOST_PYTHON_PYCRYPTO_DEPENDENCIES = host-gmp
 
 # The configure step needs to be run outside of the setup.py since it isn't
 # run correctly for cross-compiling
