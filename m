Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28099CE7A9A
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A963040530;
	Thu,  5 Sep 2024 20:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_X75RGfM4g7; Thu,  5 Sep 2024 20:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34010400E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34010400E4;
	Thu,  5 Sep 2024 20:34:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF2091BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B73181E1F
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjWU4ibUYy2g for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB9F581E02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB9F581E02
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:33:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C43AF86E46; Thu,  5 Sep 2024 20:33:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 22:23:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5bd8ab48c12b583cb35c323955a41c567d5449eb
X-Git-Newrev: 32ceedbedccb6ee7981db65957d698843171cc8b
X-Patchwork-Hint: ignore
Message-Id: <20240905203358.C43AF86E46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add bluez-alsa to
 myself
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32ceedbedccb6ee7981db65957d698843171cc8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 333b242f24..e4ba04d624 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2477,6 +2477,7 @@ F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+F:	package/bluez-alsa/
 F:	package/libgit2/
 
 N:	Nicolas Serafini <nicolas.serafini@ik.me>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
