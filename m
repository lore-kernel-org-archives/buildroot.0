From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:06 +0100
Subject: [Buildroot] [PATCH 07/11] package/python-pytrie: switch SITE to
 https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pytrie/python-pytrie.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
index b651352cad..0fe78fdb17 100644
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
-- 
2.11.0
