Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0065D3B98B
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BE4403F4;
	Tue, 26 Nov 2024 13:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcY8DlTiPweW; Tue, 26 Nov 2024 13:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49691409EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49691409EE;
	Tue, 26 Nov 2024 13:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4688E4961
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302C340589
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZcuSWz9bVQT for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E75A405E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E75A405E9
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28E4C86647; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:25:20 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: cd42b188bfb9c4432291b40f2ca471fac8b82121
X-Git-Newrev: 44ebe8ee2bcb42006885bfe27aa2d91fe0ebaced
X-Patchwork-Hint: ignore
Message-Id: <20241126132639.28E4C86647@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] DEVELOPERS: drop Asaf
 Kahlon
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=44ebe8ee2bcb42006885bfe27aa2d91fe0ebaced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Asaf has privately requested to be removed from the DEVELOPERS file as
he will no longer be contributing to Buildroot in the forseeable
future.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 353a37b04d0da29b0dfda3c98381b24839a1adc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d1694244f1..6081ef2ce0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -278,18 +278,6 @@ F:	package/python-bottle/
 F:	package/sqlcipher/
 F:	package/stress/
 
-N:	Asaf Kahlon <asafka7@gmail.com>
-F:	package/collectd/
-F:	package/libfuse3/
-F:	package/libuv/
-F:	package/python*
-F:	package/snmpclitools/
-F:	package/spdlog/
-F:	package/uftp/
-F:	package/uftrace/
-F:	package/uvw/
-F:	package/zeromq/
-
 N:	Ash Charles <ashcharles@gmail.com>
 F:	package/pru-software-support/
 F:	package/ti-cgt-pru/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
