Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F8CC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CAE41584;
	Mon,  8 Jan 2024 22:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12CAE41584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKuHoOCsIk9G; Mon,  8 Jan 2024 22:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A64C4136C;
	Mon,  8 Jan 2024 22:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A64C4136C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64F761BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B7E4831DA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B7E4831DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZU3DjNv_cqDp for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:42:43 +0000 (UTC)
Received: from relay3.mail.vrmd.de (relay3.mail.vrmd.de [81.28.224.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAB8C82BA1
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAB8C82BA1
Received: from [2a00:1c38:1:1:511c:e03c::] (helo=webmail.variomedia.de)
 by relay3.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rMyKO-0079fC-9C; Mon, 08 Jan 2024 23:42:40 +0100
MIME-Version: 1.0
Date: Mon, 08 Jan 2024 23:42:37 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: buildroot@buildroot.org
In-Reply-To: <20231227182429.1215185-3-mail@sebastianbauer.info>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <20231227182429.1215185-3-mail@sebastianbauer.info>
Message-ID: <76aeb2d49077c244ebc000257ed9b2f3@sebastianbauer.info>
X-Sender: mail@sebastianbauer.info
X-Relay-User: mail@sebastianbauer.info
Subject: Re: [Buildroot] [PATCH 3/3] packages/libcamera-apps: Fix build to
 use meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Am 2023-12-27 19:24, schrieb Sebastian Bauer:
> Upstream uses meson instead of cmake since a while.

Is there any opion about this patch? Any hints are much appreciated.

Best
Sebastian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
