Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DF6C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 09:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E8BC60FA3;
	Sat, 27 May 2023 09:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E8BC60FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2LhfrWw_nSc8; Sat, 27 May 2023 09:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E10660E72;
	Sat, 27 May 2023 09:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E10660E72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71EC81BF34B
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B4D360E72
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B4D360E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRNl7JmrHzK4 for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 09:51:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1AE560B65
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1AE560B65
 for <buildroot@buildroot.org>; Sat, 27 May 2023 09:51:00 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0ADFE40005;
 Sat, 27 May 2023 09:50:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q2qZd-0072kH-2m; Sat, 27 May 2023 11:50:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230524205629.2934876-1-bernd.kuhls@t-online.de>
Date: Sat, 27 May 2023 11:50:56 +0200
In-Reply-To: <20230524205629.2934876-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 24 May 2023 22:56:28 +0200")
Message-ID: <87ttvyumpr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 2, 3}.x series
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
