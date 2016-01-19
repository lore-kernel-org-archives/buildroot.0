From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:45:48 +0100
Subject: [Buildroot] [git commit] python-pydal: remove useless empty newline
Message-ID: <20160119204631.0DC9F81E5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd999c8a37487c13e05659f255c1c25850846e4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is an empty newline between the "help" keyword, and the help
text, which we don't normally do in Buildroot. This commit gets rid of
this useless empty newline.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pydal/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
index 9aa16f5..f1c97f9 100644
--- a/package/python-pydal/Config.in
+++ b/package/python-pydal/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYDAL
 	bool python-pydal
 	help
-
 	  pyDAL is a pure Python Database Abstraction Layer.  It
 	  dynamically generates the SQL in real time using the
 	  specified dialect for the database back end, so that you do
