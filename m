Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01286C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D0BE41B51;
	Sat,  3 Feb 2024 17:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0BE41B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfTTRlluDi1I; Sat,  3 Feb 2024 17:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFD441C59;
	Sat,  3 Feb 2024 17:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFD441C59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AFA91BF2F8
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5919C60AC6
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGlCndKH7U2n for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 11:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9742C60AAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9742C60AAC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9742C60AAC
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 11:27:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A4CBFF809;
 Sat,  3 Feb 2024 11:27:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWEAw-009LD1-19;
 Sat, 03 Feb 2024 12:27:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-3-adam.duskett@amarulasolutions.com>
 <Zaw-71RHMeYgH6yO@landeda>
Date: Sat, 03 Feb 2024 12:27:10 +0100
In-Reply-To: <Zaw-71RHMeYgH6yO@landeda> (Yann E. MORIN's message of "Sat, 20
 Jan 2024 22:45:19 +0100")
Message-ID: <875xz5u6sx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 02/10] package/depot-tools: bump version
 to 8d14454ba4a35fd9d2483842b08815a2357ec86f
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Adam, All,
 > On 2024-01-17 15:50 -0700, Adam Duskett spake thusly:

 > The comments you provided in the cover letter really belonged to this
 > commmit log, so I copied that as-is (apart for line-wrapping).

 >> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

 > Applied to master, thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
