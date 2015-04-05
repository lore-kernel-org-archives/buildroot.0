From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Apr 2015 21:28:15 +0200
Subject: [Buildroot] [git commit] python-coherence: fix legal-info
Message-ID: <20150405192929.2969B8195E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b0aea1b6cff5a9d3898e5a4eb1f79044b77ebed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Typo in license file name.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-coherence/python-coherence.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
