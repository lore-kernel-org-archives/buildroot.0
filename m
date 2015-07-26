From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:28:55 +0200
Subject: [Buildroot] [git commit branch/next] python-pypcap: Bump version
	and change site
Message-ID: <20150808105642.D70E77FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=facf243dc90ca4d23903903c4e31f0393ab4636a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Google Code is a closing forge, python-pypcap has already made the
move to Github.

We are not using the latest available tag as it dates back from 2005,
and ~20 more commits have been made after the last tag. Therefore,
we're using the latest commit.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pypcap/python-pypcap.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-pypcap/python-pypcap.mk b/package/python-pypcap/python-pypcap.mk
index 89f2dc1..bff9d8f 100644
--- a/package/python-pypcap/python-pypcap.mk
+++ b/package/python-pypcap/python-pypcap.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PYPCAP_VERSION = 102
-PYTHON_PYPCAP_SITE = https://pypcap.googlecode.com/svn/trunk
-PYTHON_PYPCAP_SITE_METHOD = svn
+PYTHON_PYPCAP_VERSION = 6f46e7bf29a648256ddc732a7d0ec83d3ffca390
+PYTHON_PYPCAP_SITE = $(call github,dugsong,pypcap,$(PYTHON_PYPCAP_VERSION))
 PYTHON_PYPCAP_LICENSE = BSD-3c
 PYTHON_PYPCAP_LICENSE_FILES = LICENSE
 PYTHON_PYPCAP_SETUP_TYPE = distutils
