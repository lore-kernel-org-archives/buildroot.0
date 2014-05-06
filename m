From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:40 -0500
Subject: [Buildroot] [PATCH 05/11] python-pyasn: update license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-6-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct license information after switch to correct package on commit
5aa4f71b51a3713d765b0e430fc34abecd0bea93.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/python-pyasn/python-pyasn.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index a5f801e..b44a56a 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -7,7 +7,8 @@
 PYTHON_PYASN_VERSION = 0.1.7
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1/
-PYTHON_PYASN_LICENSE = LGPLv3+ (pyasn.cpp), GPLv2+ (libgds)
+PYTHON_PYASN_LICENSE = BSD-2c
+PYTHON_PYASN_LICENSE_FILES = LICENSE
 PYTHON_PYASN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
-- 
1.7.9.5
