Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710D3C83F01
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 11:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1440F83065;
	Thu, 31 Aug 2023 11:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1440F83065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGckcA-TAWjl; Thu, 31 Aug 2023 11:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7909581458;
	Thu, 31 Aug 2023 11:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7909581458
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7AA61BF3AE
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 11:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B113B612A4
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 11:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B113B612A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfyMGBKDFvaN for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 11:10:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E69E660D8E
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 11:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E69E660D8E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A5621C0005;
 Thu, 31 Aug 2023 11:10:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbfZ2-000gZI-Er; Thu, 31 Aug 2023 13:10:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
References: <20230803073704.1379495-1-luca.ceresoli@bootlin.com>
 <20230803073704.1379495-2-luca.ceresoli@bootlin.com>
Date: Thu, 31 Aug 2023 13:10:16 +0200
In-Reply-To: <20230803073704.1379495-2-luca.ceresoli@bootlin.com> (Luca
 Ceresoli via buildroot's message of "Thu, 3 Aug 2023 09:37:04 +0200")
Message-ID: <87il8vmprb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: fix wrong variable
 name in comment
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Luca" == Luca Ceresoli via buildroot <buildroot@buildroot.org> writes:

 > There is no such thing as a BR2_TARGET_GENERIC_TTY_PATH variable. The
 > comment here should mention BR2_TARGET_GENERIC_GETTY_PORT instead.

 > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
