From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Sep 2015 13:09:05 +0100
Subject: [Buildroot] [PATCH] docs/manual: add the "mark as superseded" hint
Message-ID: <1441627745-1553-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 docs/manual/contribute.txt |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 5f0762f..e24a0c5 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -298,6 +298,9 @@ $ git format-patch --subject-prefix "PATCH v4" \
     -M -s -o outgoing origin/master
 ---------------------
 
+When you provide a new version of a patch, please mark the old one as
+superseded in http://patchwork.buildroot.org[patchwork].
+
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
 
-- 
1.7.1
