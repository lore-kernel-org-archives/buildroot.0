From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:40 +0100
Subject: [Buildroot] [git commit] package/python-ipaddr: switch SITE to https
Message-ID: <20171213070253.8496F7FB30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3677776c488a2462b0b6dc33d4a31b4bc98de6e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipaddr/python-ipaddr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ipaddr/python-ipaddr.mk b/package/python-ipaddr/python-ipaddr.mk
index 8bfb543..84c486d 100644
--- a/package/python-ipaddr/python-ipaddr.mk
+++ b/package/python-ipaddr/python-ipaddr.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPADDR_VERSION = 2.1.11
 PYTHON_IPADDR_SOURCE = ipaddr-$(PYTHON_IPADDR_VERSION).tar.gz
-PYTHON_IPADDR_SITE = http://pypi.python.org/packages/source/i/ipaddr
+PYTHON_IPADDR_SITE = https://pypi.python.org/packages/source/i/ipaddr
 PYTHON_IPADDR_SETUP_TYPE = distutils
 PYTHON_IPADDR_LICENSE = Apache-2.0
 PYTHON_IPADDR_LICENSE_FILES = COPYING
