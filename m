From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 23 Jan 2016 13:28:49 -0200
Subject: [Buildroot] [PATCH v1 3/3] docs/manual: add version number to patch
	in prerequisites
In-Reply-To: <1453562929-19230-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1453562929-19230-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1453562929-19230-3-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patch version 2.5.9 or later is required to apply patches that change
a file with space in the name

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
In the current master branch the only package that patches a filename with
spaces is libsoil.
---
 docs/manual/prerequisite.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 7edad1f..a9d69b6 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -26,7 +26,7 @@ between distributions).
 ** +gcc+ (version 2.95 or any later)
 ** `g++` (version 2.95 or any later)
 ** +bash+
-** +patch+
+** +patch+ (version 2.5.9 or any later)
 ** +gzip+
 ** +bzip2+
 ** +perl+ (version 5.8.7 or any later)
-- 
1.9.1
