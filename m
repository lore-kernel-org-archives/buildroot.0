Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A95AD5E36B
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB7B82106;
	Sat,  9 Nov 2024 18:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzxlO4YyaP-3; Sat,  9 Nov 2024 18:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BDAA820AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BDAA820AC;
	Sat,  9 Nov 2024 18:47:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA6A6D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9562840242
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzKujsNBx0ju for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97CAA4013B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97CAA4013B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FA4285F27; Sat,  9 Nov 2024 18:47:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 19:29:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40e2726bff0a6e5ee666db756eea68b4829e9b4e
X-Git-Newrev: 4e737fb0be1bb4212577358e5c06f2056a4ff33e
X-Patchwork-Hint: ignore
Message-Id: <20241109184753.7FA4285F27@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-magic-wormhole-mailbox-server: bump to version 0.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e737fb0be1bb4212577358e5c06f2056a4ff33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches which are now upstream.

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...move-the-U-open-mode-removed-in-Python-3..patch |   39 -
 .../0002-Update-versioneer-to-0.29.patch           | 2194 --------------------
 .../python-magic-wormhole-mailbox-server/Config.in |    1 -
 .../python-magic-wormhole-mailbox-server.hash      |    4 +-
 .../python-magic-wormhole-mailbox-server.mk        |    4 +-
 5 files changed, 4 insertions(+), 2238 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
