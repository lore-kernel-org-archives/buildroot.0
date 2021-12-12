Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1913C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A172785A50;
	Sun, 12 Dec 2021 22:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyQHj7KGQeUI; Sun, 12 Dec 2021 22:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E99A683ED8;
	Sun, 12 Dec 2021 22:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7B71BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88AA04297F
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zyb6VpH-Uosi for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:22:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75F3F4297E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:22:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 37624240006;
 Sun, 12 Dec 2021 22:22:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwXER-00034g-74; Sun, 12 Dec 2021 23:22:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211204224123.2022812-1-fontaine.fabrice@gmail.com>
Date: Sun, 12 Dec 2021 23:22:11 +0100
In-Reply-To: <20211204224123.2022812-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 4 Dec 2021 23:41:23 +0100")
Message-ID: <87pmq1tqek.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/hiawatha: add
 HIAWATHA_CPE_ID_VENDOR
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:hiawatha-webserver:hiawatha is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ahiawatha-webserver%3Ahiawatha

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
