Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B219C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 19:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F3360E17;
	Wed, 24 Apr 2024 19:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Makfbnts6ke3; Wed, 24 Apr 2024 19:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B9F360E21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9F360E21;
	Wed, 24 Apr 2024 19:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC8681BF34A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A66F7416F2
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qHu5wQw2l6w for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 19:50:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0595E40449
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0595E40449
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 19:50:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE6B986127; Wed, 24 Apr 2024 19:50:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 21:50:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d366dbf562a959a3dca3ee6972d5a67f67aa885
X-Git-Newrev: 32753c6f9d7c61e1c5b79925b00ad03fa76b5b22
X-Patchwork-Hint: ignore
Message-Id: <20240424195044.CE6B986127@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .github: add a pull request warning that
 explains the mailing list workflow
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
Content-Type: multipart/mixed; boundary="===============3765687821613914552=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3765687821613914552==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=32753c6f9d7c61e1c5b79925b00ad03fa76b5b22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Reviewed-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .github/pull_request_template.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.github/pull_request_template.md b/.github/pull_request_template.md
new file mode 100644
index 0000000000..319e67d861
--- /dev/null
+++ b/.github/pull_request_template.md
@@ -0,0 +1,6 @@
+Please do not submit a Pull Request via GitHub. Buildroot makes use of a
+[mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
+See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
+
+Thanks for your help!
+

--===============3765687821613914552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3765687821613914552==--
