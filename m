Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B9EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 10:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D4AF40C59;
	Mon, 11 Sep 2023 10:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D4AF40C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUfSHZAHtS7f; Mon, 11 Sep 2023 10:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69D2F40C2C;
	Mon, 11 Sep 2023 10:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D2F40C2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 767731BF28E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D401606A0
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 10:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D401606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cabKSkWWn-L0 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 10:33:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49E2F606F5
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 10:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49E2F606F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22C3F6000B;
 Mon, 11 Sep 2023 10:33:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfeEV-00Ef4i-2H; Mon, 11 Sep 2023 12:33:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20230808031350.116041-1-dalang@gmx.at>
Date: Mon, 11 Sep 2023 12:33:31 +0200
In-Reply-To: <20230808031350.116041-1-dalang@gmx.at> (Daniel Lang's message of
 "Tue, 8 Aug 2023 05:13:48 +0200")
Message-ID: <87v8chatj8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libksba: update CPE ID
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

>>>>> "Daniel" == Daniel Lang <dalang@gmx.at> writes:

 > libksba_project:libksba has been deprecated by NVD [0],
 > gnupg:libksba should be used instead.

 > [0]:
 > https://nvd.nist.gov/products/cpe/detail/AA709F75-0B9E-4B67-ACEA-C1DCF33E7745?namingFormat=2.3&orderBy=CPEURI&keyword=libksba&status=FINAL

 > Signed-off-by: Daniel Lang <dalang@gmx.at>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
