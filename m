Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2937C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B26408D2;
	Tue, 16 Aug 2022 08:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B26408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sY6_xpNfF5vR; Tue, 16 Aug 2022 08:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF44408F2;
	Tue, 16 Aug 2022 08:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF44408F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 494881BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E93464064C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E93464064C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ixwUaKg1QUS for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F2C401F2
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F2C401F2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC1AB87736; Tue, 16 Aug 2022 08:20:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:21:10 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 4a6308d9c69350910d4e4687a6324ae3a5aca399
X-Git-Newrev: 138d70995fe31967422aa6b87cee2e55ab431213
X-Patchwork-Hint: ignore
Message-Id: <20220816082038.EC1AB87736@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] docs/manual: fix
 patchwork URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=138d70995fe31967422aa6b87cee2e55ab431213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

http://patchwork.buildroot.org is redirecting to
https://bugs.busybox.net so replace it by
https://patchwork.ozlabs.org/project/buildroot/list/ as already done in
docs/website/contribute.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 002f0e927d857e51595cedf3d2a44613b4f7e5f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 18 +++++++++++-------
 docs/manual/resources.txt  |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index bf2aed6b51..e588c69be6 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -418,7 +418,8 @@ editing the commit message. Below the +Signed-off-by+ section, add
 +---+ and your changelog.
 
 Although the changelog will be visible for the reviewers in the mail
-thread, as well as in http://patchwork.buildroot.org[patchwork], +git+
+thread, as well as in
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork], +git+
 will automatically ignores lines below +---+ when the patch will be
 merged. This is the intended behavior: the changelog is not meant to
 be preserved forever in the +git+ history of the project.
@@ -470,19 +471,22 @@ $ git format-patch -v4 -M -s -o outgoing origin/master
 ---------------------
 
 When you provide a new version of a patch, please mark the old one as
-superseded in http://patchwork.buildroot.org[patchwork]. You need to
-create an account on http://patchwork.buildroot.org[patchwork] to be
+superseded in
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. You
+need to create an account on
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] to be
 able to modify the status of your patches. Note that you can only change
 the status of patches you submitted yourself, which means the email
-address you register in http://patchwork.buildroot.org[patchwork] should
+address you register in
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] should
 match the one you use for sending patches to the mailing list.
 
 You can also add the +--in-reply-to <message-id>+ option when
 submitting a patch to the mailing list. The id of the mail to reply to
 can be found under the "Message Id" tag on
-http://patchwork.buildroot.org[patchwork].  The advantage of
-*in-reply-to* is that patchwork will automatically mark the previous
-version of the patch as superseded.
+https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. The
+advantage of *in-reply-to* is that patchwork will automatically mark
+the previous version of the patch as superseded.
 
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index e90a49b2ab..68b7eb9062 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -68,4 +68,4 @@ review comments in a clean and concise web interface, it can be useful
 for all Buildroot developers.
 +
 The Buildroot patch management interface is available at
-http://patchwork.buildroot.org[].
+https://patchwork.ozlabs.org/project/buildroot/list/[].
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
