From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 22:06:49 +0100
Subject: [Buildroot] [git commit] python-pyparsing: rename package's
	Config.in bool
Message-ID: <20131204210742.C4A2D9BECA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7af351d8da750fd7e3052459b2b2dd9f7041ff25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove unnecessary tab/spaces on blank line.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyparsing/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
index 378119a..49a474b 100644
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYPARSING
-	bool "pyparsing"
+	bool "python-pyparsing"
 	depends on BR2_PACKAGE_PYTHON
 	help
 	  The pyparsing module is an alternative approach to creating and
