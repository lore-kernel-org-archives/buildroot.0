From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:49 +0100
Subject: [Buildroot] [git commit] package/python-pytrie: switch SITE to https
Message-ID: <20171213070253.B01C17FB30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=033f4d1ca26f18d2704bb599abe4ed94edf6131f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pytrie/python-pytrie.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
index b651352..0fe78fd 100644
--- a/package/python-pytrie/python-pytrie.mk
+++ b/package/python-pytrie/python-pytrie.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_PYTRIE_VERSION = 0.2
-PYTHON_PYTRIE_SITE = http://pypi.python.org/packages/source/P/PyTrie
+PYTHON_PYTRIE_SITE = https://pypi.python.org/packages/source/P/PyTrie
 PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
 PYTHON_PYTRIE_LICENSE = BSD-3-Clause
 PYTHON_PYTRIE_LICENSE_FILES = LICENSE
