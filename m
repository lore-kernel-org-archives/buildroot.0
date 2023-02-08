Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6C3C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F87B8207D;
	Wed,  8 Feb 2023 16:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F87B8207D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5pFxD81WC6L; Wed,  8 Feb 2023 16:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A62F82065;
	Wed,  8 Feb 2023 16:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A62F82065
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BCCC1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8148161142
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8148161142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Lbhb8ELrMGh for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:44:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1F7061135
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1F7061135
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0B178477B; Wed,  8 Feb 2023 16:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 17:43:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41671deec7b00de10dcc372cdeee4400df1d76ee
X-Git-Newrev: 416213be39c6adb860a9d3e85f0a634139c27cac
X-Patchwork-Hint: ignore
Message-Id: <20230208164447.A0B178477B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update e-mail for Frank
 Vanbever
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

commit: https://git.buildroot.net/buildroot/commit/?id=416213be39c6adb860a9d3e85f0a634139c27cac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e116e92a3..32c6e54919 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1088,7 +1088,7 @@ F:	package/sane-backends/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-N:	Frank Vanbever <frank.vanbever@essensium.com>
+N:	Frank Vanbever <frank.vanbever@mind.be>
 F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
