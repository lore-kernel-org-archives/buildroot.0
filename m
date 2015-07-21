From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 21 Jul 2015 08:15:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/debianutils: improve help text
Message-ID: <1437459327-7477-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a note about the installed utilities.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/debianutils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/debianutils/Config.in b/package/debianutils/Config.in
index f865868..a3f7510 100644
--- a/package/debianutils/Config.in
+++ b/package/debianutils/Config.in
@@ -4,4 +4,8 @@ config BR2_PACKAGE_DEBIANUTILS
 	help
 	  Miscellaneous utilities specific to Debian.
 
+	  The specific utilities included are:
+	  add-shell installkernel ischroot remove-shell run-parts savelog
+	  tempfile which
+
 	  https://tracker.debian.org/pkg/debianutils
-- 
2.4.6
