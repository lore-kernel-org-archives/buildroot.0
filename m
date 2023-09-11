Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A7FC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 18:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B116641504;
	Mon, 11 Sep 2023 18:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B116641504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RU4BSsTCbwjo; Mon, 11 Sep 2023 18:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0927B414EC;
	Mon, 11 Sep 2023 18:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0927B414EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6B6A1BF20B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFEB96104F
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFEB96104F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i67-hb1EMWby for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 18:55:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B072660777
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 18:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B072660777
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC823C0014;
 Mon, 11 Sep 2023 18:55:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfm44-00Fis6-Dd; Mon, 11 Sep 2023 20:55:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20230808184657.4041-1-dalang@gmx.at>
Date: Mon, 11 Sep 2023 20:55:16 +0200
In-Reply-To: <20230808184657.4041-1-dalang@gmx.at> (Daniel Lang's message of
 "Tue, 8 Aug 2023 20:46:55 +0200")
Message-ID: <87a5tsbkvf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/dracut: add CPE ID
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
Cc: Thierry Bultel <tbultel@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Daniel" == Daniel Lang <dalang@gmx.at> writes:

 > dracut_project:dracut is a valid CPE ID:
 > https://nvd.nist.gov/products/cpe/detail/8050B12A-93FB-453E-8459-9B8B9CC7544E?namingFormat=2.3&orderBy=CPEURI&keyword=dracut&status=FINAL

 > Signed-off-by: Daniel Lang <dalang@gmx.at>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
