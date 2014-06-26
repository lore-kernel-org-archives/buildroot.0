From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 09:47:50 +0200
Subject: [Buildroot] [git commit] python-id3: add license information
Message-ID: <20140626115219.02EF99CF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=399371e6100e53ef95badf0b3eb1594d2f06166c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-id3/python-id3.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
index 5957f64..157576e 100644
--- a/package/python-id3/python-id3.mk
+++ b/package/python-id3/python-id3.mk
@@ -8,5 +8,7 @@ PYTHON_ID3_VERSION = 1.2
 PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
 PYTHON_ID3_SITE = http://downloads.sourceforge.net/project/id3-py/id3-py/$(PYTHON_ID3_VERSION)
 PYTHON_ID3_SETUP_TYPE = distutils
+PYTHON_ID3_LICENSE = GPLv2+
+PYTHON_ID3_LICENSE_FILES = COPYING
 
 $(eval $(python-package))
