From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:08:12 +0200
Subject: [Buildroot] [git commit] support/scripts: document args to
	_is_package() in gen-manual-lists
Message-ID: <20140608151244.39ECE9CC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cffe52b773295dedda290be070fd60d39ebfef3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/gen-manual-lists.py |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
