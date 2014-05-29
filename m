From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 May 2014 22:38:16 +0200
Subject: [Buildroot] [PATCH 02/11 RFC] support/scripts: document args to
	_is_package() in gen-manual-lists
In-Reply-To: <cover.1401395407.git.yann.morin.1998@free.fr>
References: <cover.1401395407.git.yann.morin.1998@free.fr>
Message-ID: <80067b7fe9abeceb9711ade803168a4ac4df86cf.1401395407.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/gen-manual-lists.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index aee2299..b33fcf0 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -242,6 +242,8 @@ class Buildroot:
         """ Return True if the symbol is a package or a host package, otherwise
         False.
 
+        :param symbol:  The symbol to check
+
         """
         if not self.re_pkg_prefix.match(symbol.get_name()):
             return False
-- 
1.8.3.2
