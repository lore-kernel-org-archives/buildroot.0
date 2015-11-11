From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 11 Nov 2015 18:47:41 +0100
Subject: [Buildroot] [PATCH] docs/manual: fix bash export syntax in example
	code
Message-ID: <1447264061-21523-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To export a variable in .bashrc we shouldn't put a '$' at the
beginning of the line, and there must be a '=' between key and value.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/download-location.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index cca7e7e..0b53f54 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -17,7 +17,7 @@ set, then the value of +BR2_DL_DIR+ in the Buildroot configuration is
 overridden. The following line should be added to +<~/.bashrc>+.
 
 -----------------
- $ export BR2_DL_DIR <shared download location>
+ export BR2_DL_DIR=<shared download location>
 -----------------
 
 The download location can also be set in the +.config+ file, with the
-- 
1.9.1
