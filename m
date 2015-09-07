From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Sep 2015 23:52:35 +0200
Subject: [Buildroot] [git commit] docs/manual: add the "mark as superseded"
	hint
Message-ID: <20150907221138.1725F81E9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76bcbae365b82304b7ad0bfd007a5e0a97ea4bde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 5f0762f..40579f9 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -298,6 +298,14 @@ $ git format-patch --subject-prefix "PATCH v4" \
     -M -s -o outgoing origin/master
 ---------------------
 
+When you provide a new version of a patch, please mark the old one as
+superseded in http://patchwork.buildroot.org[patchwork]. You need to
+create an account on http://patchwork.buildroot.org[patchwork] to be
+able to modify the status of your patches. Note that you can only change
+the status of patches you submitted yourself, which means the email
+address you register in http://patchwork.buildroot.org[patchwork] should
+match the one you use for sending patches to the mailing list.
+
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
 
