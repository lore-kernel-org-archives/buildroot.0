Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C1DE8FDA6
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 11:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F44B81638;
	Fri, 26 Dec 2025 11:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2hve_a1gm5C; Fri, 26 Dec 2025 11:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46EA881584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766747128;
	bh=Fy85SdkFEkhjk+LuYdGjcFqLQNhGmhLPsP7aa8ZFjdM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n9i6hOk42eewb/mdX6DX0hHUM8EtO1gfiTZGSVnpsplzSvUc9pJrN+ccNIZMO7zMR
	 vphSf0E8rbzsq9eUXxT/JwFUXSV7MPGcyGjBUX+AzKlYeQ8fbh1olNAtppTsZdFKoS
	 F8JytB8U4ZKOfPPagT6h0jKpxhc0hA6q7REKw6dTT/ZQFYMA12XPqV7Y92wiI5GFG4
	 xP81bu7R487BC4xMN0FAuZOQrWwjdMTe5Ct+xg2itR8QINdrXbT45sTEPAiXWuvo4Q
	 4LXXBg00K1OfvZldjCtf/bLSpWEDrluAkZYWvle2tr7basmWmkxxNaDT7us1gd7lwU
	 w4C2kZkz3Qpgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46EA881584;
	Fri, 26 Dec 2025 11:05:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0F62119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A773240921
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaWcrR0t0O6W for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1317840920
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1317840920
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0443783AD3; Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 11:46:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef70ba7b243d5126c453b32245807d091c3bf734
X-Git-Newrev: edf4a89aaf9d7af884149a431a141a4b80c524bc
X-Patchwork-Hint: ignore
Message-Id: <20251226110526.0443783AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to vim
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edf4a89aaf9d7af884149a431a141a4b80c524bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a06035b869..c5a2d5c772 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1333,6 +1333,7 @@ F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/util-linux/
+F:	package/vim/
 F:	package/wilc-driver/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
