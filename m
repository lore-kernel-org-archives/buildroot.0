From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 7 Oct 2013 11:57:20 -0500
Subject: [Buildroot] [PATCH 1/2] python-pygame: rename package's Config.in
	bool
Message-ID: <1381165041-9024-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

---
Trivial Fix:
This makes the naming of the package in the menuconfig consistent with
the naming of the package's directory and make rules.
---
 package/python-pygame/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index 1b0a8b9..b9a367d 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYGAME
-	bool "pygame"
+	bool "python-pygame"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_SDL
 	help
-- 
1.7.1
