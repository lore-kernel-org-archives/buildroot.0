Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEC2C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F87661233;
	Tue,  6 Feb 2024 16:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F87661233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dLnsOAZNsP0; Tue,  6 Feb 2024 16:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADBE961042;
	Tue,  6 Feb 2024 16:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADBE961042
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA371BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B82782D17
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsAae1nj0VQr for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:51:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C73F82D14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C73F82D14
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C73F82D14
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:51:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C567240008;
 Tue,  6 Feb 2024 16:51:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXOfb-00E5Aq-1b;
 Tue, 06 Feb 2024 17:51:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
References: <20240131201747.23175-1-peter.macleod.thompson@gmail.com>
Date: Tue, 06 Feb 2024 17:51:39 +0100
In-Reply-To: <20240131201747.23175-1-peter.macleod.thompson@gmail.com> (Peter
 Thompson's message of "Wed, 31 Jan 2024 13:17:47 -0700")
Message-ID: <874jel7cys.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.22.0
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

>>>>> "Peter" == Peter Thompson <peter.macleod.thompson@gmail.com> writes:

 > From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
 > Update LICENSE.txt hash for change in copyright year to 2024

 > Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
