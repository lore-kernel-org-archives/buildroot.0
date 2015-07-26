From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:37 +0200
Subject: [Buildroot] [PATCH 11/12] python-pypcap: Bump version and change
	site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1437943118-18060-12-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is a closing forge, python-dpkt has already made the move to
Github.

We are not using the latest tag, it's dated from 2005 and the latests
commits is from 2010 with ~20 commits between them.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/python-pypcap/python-pypcap.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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
-- 
2.1.4
