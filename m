Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B8DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 459C042DB5;
	Fri, 28 Feb 2025 16:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rL4BwFji6JRu; Fri, 28 Feb 2025 16:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 716CC42DEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 716CC42DEE;
	Fri, 28 Feb 2025 16:30:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 164B4711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA1A54199C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMhTGI55k2zO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E42241807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E42241807
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96BE8879C2; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Nov 2024 11:52:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e2515a5ad79214d954ecedb9f37eef26a36a0c2
X-Git-Newrev: 353a37b04d0da29b0dfda3c98381b24839a1adc9
X-Patchwork-Hint: ignore
Message-Id: <20250228162929.96BE8879C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: drop Asaf Kahlon
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=353a37b04d0da29b0dfda3c98381b24839a1adc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Asaf has privately requested to be removed from the DEVELOPERS file as
he will no longer be contributing to Buildroot in the forseeable
future.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..fc189fa644 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -282,18 +282,6 @@ F:	package/python-bottle/
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
