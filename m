From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 21:46:13 +0100
Subject: [Buildroot] [git commit] manual: remove suggestion of aligning =
	signs in .mk files
Message-ID: <20140122204854.947029C5C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ead1d2645bd94c064ed76d5714f4e632fc878acd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not buildroot convention to align the = signs in .mk files, so this
shouldn't be suggested in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/writing-rules.txt |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index b649c9f..376dbfd 100644
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
