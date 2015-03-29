From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:26 +0200
Subject: [Buildroot] [PATCH 12/35] Makefile: remove dubious comment
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This comment is a left-over from previous code changes, and it doesn't
make much sense where it is placed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index edb122b..5a6f825 100644
--- a/Makefile
+++ b/Makefile
@@ -375,9 +375,6 @@ endif
 include package/Makefile.in
 include support/dependencies/dependencies.mk
 
-# We also need the various per-package makefiles, which also add
-# each selected package to TARGETS if that package was selected
-# in the .config file.
 include toolchain/*.mk
 include toolchain/*/*.mk
 
-- 
2.1.0
