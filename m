From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 13:20:43 +0200
Subject: [Buildroot] [git commit] python-netifaces: add license information
Message-ID: <20140507120710.AAC379CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3ef7d20ae7ec80012cfd3623f8daa40e51e8efa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-netifaces/python-netifaces.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index faa39bd..33d63cf 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -7,6 +7,8 @@
 PYTHON_NETIFACES_VERSION = 0.7
 PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
 PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
+PYTHON_NETIFACES_LICENSE = MIT
+PYTHON_NETIFACES_LICENSE_FILES = README
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
