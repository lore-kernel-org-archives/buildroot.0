From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  1 Feb 2016 23:19:53 +0100
Subject: [Buildroot] [PATCH v2 2/5] docs/manual: slightly clarify patch
	licensing
In-Reply-To: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1454365196-26319-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a patch is a modification to Buildroot. Thus this sentence might be
interpreted as "Patches are released under the Buildroot license".

Being a legal matter, the last thing we want is to be
ambiguous. Reword the sentence to avoid any misunderstandings.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
- "they modify" -> "they apply to" (Thomas).
---
 docs/manual/patch-policy.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 0b4604e..d50c971 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -90,8 +90,8 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
 
 === Format and licensing of the package patches
 
-Patches are released under the same license as the software that is
-modified.
+Patches are released under the same license as the software they apply
+to.
 
 A message explaining what the patch does, and why it is needed, should
 be added in the header commentary of the patch.
-- 
1.9.1
