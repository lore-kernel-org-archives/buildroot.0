Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C8DC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E31415E5;
	Sun,  7 Jan 2024 17:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E31415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FgvvM5kF6XJx; Sun,  7 Jan 2024 17:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2DF415E3;
	Sun,  7 Jan 2024 17:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2DF415E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4E821BF3C0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE16260681
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE16260681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0G3DF4k7QCw for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:34:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4904606A0
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4904606A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CD1E240003;
 Sun,  7 Jan 2024 17:34:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMX2t-006iy2-1r;
 Sun, 07 Jan 2024 18:34:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
Date: Sun, 07 Jan 2024 18:34:47 +0100
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com> (Adam
 Duskett's message of "Mon, 18 Dec 2023 12:39:46 -0700")
Message-ID: <87o7dxyrm0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 01/14] package/sway/Config.in: Remove
 duplicate dependencies
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

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 > ---
 > v1 -> v2: Add to series

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
