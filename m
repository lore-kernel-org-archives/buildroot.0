Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0096BC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914E9415FE;
	Sun, 12 Mar 2023 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914E9415FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwKoAD2VSAtU; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9681541625;
	Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9681541625
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6CD21BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E8BA40603
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E8BA40603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id na3iAk9gVuQQ for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA72A40106
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA72A40106
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7E5187006; Sun, 12 Mar 2023 21:46:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 23:32:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f90fd1b8f4a368b1a586069c4f29d600e6705bd1
X-Git-Newrev: f2c1e10b8ac3531ab5a48e23c23b702cd24b3f73
X-Patchwork-Hint: ignore
Message-Id: <20230312214621.B7E5187006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyalsa: add option to enable
 utility tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2c1e10b8ac3531ab5a48e23c23b702cd24b3f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add option to enable useful tools,
like tinyplay, tinymix, etc.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinyalsa/Config.in   | 9 +++++++++
 package/tinyalsa/tinyalsa.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
