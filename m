From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun,  5 Apr 2015 20:05:14 +0200
Subject: [Buildroot] [PATCH] python-coherence: fix legal-info
Message-ID: <1428257114-26525-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Typo in license file name.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-coherence/python-coherence.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-coherence/python-coherence.mk b/package/python-coherence/python-coherence.mk
index 301885b..f9df37c 100644
--- a/package/python-coherence/python-coherence.mk
+++ b/package/python-coherence/python-coherence.mk
@@ -8,7 +8,7 @@ PYTHON_COHERENCE_VERSION = 0.6.6.2
 PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,Coherence-$(PYTHON_COHERENCE_VERSION))
 PYTHON_COHERENCE_SETUP_TYPE = setuptools
 PYTHON_COHERENCE_LICENSE = MIT
-PYTHON_COHERENCE_LICENSE_FILES = LICENSE
+PYTHON_COHERENCE_LICENSE_FILES = LICENCE
 PYTHON_COHERENCE_DEPENDENCIES = python-twisted python-zope-interface python-pyasn
 
 $(eval $(python-package))
-- 
2.1.0
