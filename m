Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF5CC64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA6C6179D;
	Thu,  9 Mar 2023 20:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA6C6179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtOuAyceiOn6; Thu,  9 Mar 2023 20:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE526179A;
	Thu,  9 Mar 2023 20:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE526179A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA2F61BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C08CF82202
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08CF82202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lzw6CV3FDJ_G for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:06:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 049E0821FF
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 049E0821FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF16F86B5F; Thu,  9 Mar 2023 20:06:52 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:05:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8ad4f2d07462d8b022643c663e0fd7e9c7b5201
X-Git-Newrev: 95c0a98054a4d8f45617f233130b198cc488e847
X-Patchwork-Hint: ignore
Message-Id: <20230309200652.DF16F86B5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Julien Olivain for
 package/kexec
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

commit: https://git.buildroot.net/buildroot/commit/?id=95c0a98054a4d8f45617f233130b198cc488e847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9670302a78..82aeb6fe25 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1689,6 +1689,7 @@ F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/gnupg2/
 F:	package/highway/
+F:	package/kexec/
 F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
