Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AD1EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 13:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E0081DFC;
	Mon, 19 Jun 2023 13:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E0081DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBJVr6R5VvVM; Mon, 19 Jun 2023 13:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB10681D11;
	Mon, 19 Jun 2023 13:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB10681D11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6A31BF4DB
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 13:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 142C881D11
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 13:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142C881D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBK8jHzbmAJ9 for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 13:26:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DBFE814C9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DBFE814C9
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 13:26:33 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E07020009;
 Mon, 19 Jun 2023 13:26:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qBEtp-000pmf-IX; Mon, 19 Jun 2023 15:26:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "May, Torsten" <torsten.may@ebee.de>
References: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
Date: Mon, 19 Jun 2023 15:26:29 +0200
In-Reply-To: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
 (Torsten May's message of "Mon, 19 Jun 2023 12:46:58 +0000")
Message-ID: <87v8fjpoqi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] OpenSSL v3.0
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "May," == May, Torsten <torsten.may@ebee.de> writes:

 > Hi Peter,
 > as September is approaching quickly, is there any progress on that topic?

Unfortunately not. So far no patches for openssl 3.x have been
submitted.

If you are using openssl then now would be a VERY good time to
contribute an update to the 3.x series.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
