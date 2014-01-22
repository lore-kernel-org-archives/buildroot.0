From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 22 Jan 2014 17:12:43 +0100
Subject: [Buildroot] [PATCH] manual: remove suggestion of aligning = signs
	in .mk files
Message-ID: <6da682c597e1ae750535.1390407163@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not buildroot convention to align the = signs in .mk files, so this
shouldn't be suggested in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/writing-rules.txt |  8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -71,13 +71,7 @@ LIBFOO_VERSION = 1.0
 LIBFOO_CONF_OPT += --without-python-support
 ---------------------
 +
-It is also possible to align the +=+ signs:
-+
----------------------
-LIBFOO_VERSION   = 1.0
-LIBFOO_SOURCE    = foo-$(LIBFOO_VERSION).tar.gz
-LIBFOO_CONF_OPT += --without-python-support
----------------------
+Do not align the +=+ signs.
 
 * Indentation: use tab only:
 +
