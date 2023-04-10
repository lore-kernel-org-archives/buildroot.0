Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B2DC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAF1417C7;
	Mon, 10 Apr 2023 21:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FAF1417C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pi3Frz4UNnqg; Mon, 10 Apr 2023 21:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8E74179E;
	Mon, 10 Apr 2023 21:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A8E74179E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB441C3B6F
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2717F41796
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2717F41796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SsSP8BKXP4cw for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:12:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA10941742
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA10941742
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:12:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5B65240002;
 Mon, 10 Apr 2023 21:12:01 +0000 (UTC)
Received: from peko by be.duckdns.org with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1plynw-005YuR-KU; Mon, 10 Apr 2023 23:12:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Agner <stefan@agner.ch>
References: <fbe678c521be19c519bb86f7b86528b43266f8b0.1680680807.git.stefan@agner.ch>
 <5b01e389dc18bb36fc9a6c4e1231ca88585126f5.1680680807.git.stefan@agner.ch>
Date: Mon, 10 Apr 2023 23:12:00 +0200
In-Reply-To: <5b01e389dc18bb36fc9a6c4e1231ca88585126f5.1680680807.git.stefan@agner.ch>
 (Stefan Agner's message of "Wed, 5 Apr 2023 09:47:03 +0200")
Message-ID: <87zg7fsaqn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/docker-cli: bump version to v23.0.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:

 > This release contains some fixes and small improvements. For the
 > full list see:
 > https://github.com/moby/moby/releases/tag/v23.0.3

 > Signed-off-by: Stefan Agner <stefan@agner.ch>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
