Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCFBC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 18:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D0880E85;
	Sun, 14 Jan 2024 18:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36D0880E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yS23oLXCzOLU; Sun, 14 Jan 2024 18:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E23C80E7C;
	Sun, 14 Jan 2024 18:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E23C80E7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0290B1BF593
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCF944046D
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF944046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GiWgQV8hzwks for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 18:28:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A089440342
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 18:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A089440342
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5FCD1BF206;
 Sun, 14 Jan 2024 18:28:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rP5Dl-00E1xX-0d;
 Sun, 14 Jan 2024 19:28:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Hitz via buildroot <buildroot@buildroot.org>
References: <20240110171755.3984161-1-christian@klarinett.li>
Date: Sun, 14 Jan 2024 19:28:33 +0100
In-Reply-To: <20240110171755.3984161-1-christian@klarinett.li> (Christian Hitz
 via buildroot's message of "Wed, 10 Jan 2024 18:17:54 +0100")
Message-ID: <87fryzlqge.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libaio: add LIBAIO_CPE_ID_VENDOR
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Hitz via buildroot <buildroot@buildroot.org> writes:

 > From: Christian Hitz <christian.hitz@bbv.ch>
 > cpe:2.3:a:libaio_project:libaio:-:*:*:*:*:*:*:*is a valid CPE identifier
 > for this package:

 >   https://nvd.nist.gov/products/cpe/detail/69B8039E-7837-4DE3-8DFE-C2E4D834EE78

 > Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
