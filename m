From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 11 Nov 2013 14:58:12 +0100
Subject: [Buildroot] [PATCH] docs/manual: Add version number to perl in
	prerequisites
Message-ID: <1384178292-26910-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building host-bison needs perl 5.8.7, as it uses the "-f" option
for site customization scripts. This feature was added in 5.8.7.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 docs/manual/prerequisite.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 729d64c..adc23ee 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -33,7 +33,7 @@ Mandatory packages
 ** +patch+
 ** +gzip+
 ** +bzip2+
-** +perl+
+** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
 ** +python+ (version 2.6 or 2.7)
-- 
1.7.9.5
