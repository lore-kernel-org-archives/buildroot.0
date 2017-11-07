From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  7 Nov 2017 15:47:44 -0600
Subject: [Buildroot] [PATCH 2/2] Manual: DEVELOPERS file integrity check
In-Reply-To: <1510091264-4024-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1510091264-4024-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1510091264-4024-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 docs/manual/developers.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index 4e2cd71..a0a3668 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -44,3 +44,5 @@ the +DEVELOPERS+ file for various tasks:
   list the ones that are not handled by any developer. The purpose of
   this option is to help completing the +DEVELOPERS+ file.
 
+- When using without any arguments, it validates the integrity of the
+  DEVELOPERS file and will note WARNINGS for items that don't match.
-- 
1.9.1
