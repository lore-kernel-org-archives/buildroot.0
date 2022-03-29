Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4B6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7270F813D9;
	Tue, 29 Mar 2022 19:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8TrLLoZYFOW; Tue, 29 Mar 2022 19:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3D42813D4;
	Tue, 29 Mar 2022 19:48:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D117C1BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BED88410AF
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CjSmduAxqB0x for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:48:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8BAC4168A
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:48:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 26E9B20008;
 Tue, 29 Mar 2022 19:48:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZHpi-00Fzga-8p; Tue, 29 Mar 2022 21:48:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
References: <20220315142640.2268645-1-mirza.kapetanovic@gmail.com>
Date: Tue, 29 Mar 2022 21:48:50 +0200
In-Reply-To: <20220315142640.2268645-1-mirza.kapetanovic@gmail.com> (Mirza
 Kapetanovic's message of "Tue, 15 Mar 2022 15:26:40 +0100")
Message-ID: <87h77ga6al.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpi-gpio: enable package
 on aarch64
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Ian Haylock <haylocki@yahoo.co.uk>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Mirza" == Mirza Kapetanovic <mirza.kapetanovic@gmail.com> writes:

 > Enable the python-rpi-gpio package on 64-bit ARM architectures. I've tested
 > this with a Raspberry Pi 4 64-bit and Python 3 build and it works as expected.

 > Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
