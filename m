From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 29 Apr 2014 21:30:27 +0200
Subject: [Buildroot] [PATCH] give a hint about git rebase
Message-ID: <1398799827-13701-1-git-send-email-wbx@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems common knowledge to use git rebase in interactive mode
to fixup issues while respinning patch series, but I found it hard
to find any hint about it. Add a note for git beginners like me.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 docs/manual/contribute.txt |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 47494cb..7795e71 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -230,6 +230,8 @@ should include a changelog of the modifications between each
 submission. Note that when your patch series is introduced by a cover
 letter, an overall changelog may be added to the cover letter in
 addition to the changelog in the individual commits.
+The best thing to rework a patch series is by using +git rebase+
+in interactive mode.
 
 When added to the individual commits, this changelog is added when
 editing the commit message.  Below the +Signed-off-by+ section, add
-- 
1.7.10.4
